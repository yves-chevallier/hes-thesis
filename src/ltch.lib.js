////////////////////////////////////////////////////////////////////////////////
//   _   _        _                            _                                
//  | | | |      |_|                          | |                               
//  | |_| |_____  _ _____           _     _ __| |                               
//  | |_  | ___ || |  _  \  _____  \ \  / // _  |                               
//  | | | | ____|| | |_| | (_____)  \ \/ /( (_| |                               
//  |_| |_|_____)|_|___  |           \__/  \____|                               
//                   __| | Haute Ecole d'Ingenieurs                             
//                  |___/  et de Gestion - Vaud                                 
//                                                                              
/// @title    Librairie de dialogue avec le serveur LonTouch                    
/// @context  Travail de dipl�me                                                
/// @author   Y. Chevallier <nowox@kalios.ch>                                   
/// @file     ltch.lib.js                                                       
/// @language ASCII/JavaScript 1.5                                              
/// @svn      $Id: ltch.lib.js 82 2005-12-14 05:41:51Z Canard $                 
////////////////////////////////////////////////////////////////////////////////  

////////////////////////////////////////////////////////////////////////////////
// Messages d'erreur                                                            
//////////////////////////////////////////////////////////////////////////////// 
error_msg_1 = "Pas de propri�t�s pass�es" 

////////////////////////////////////////////////////////////////////////////////
// Compatibilit� Internet Explorer (IE)                                         
////////////////////////////////////////////////////////////////////////////////
XMLHttpRequest || (XMLHttpRequest = function() 
{
	return new ActiveXObject("Microsoft.XMLHTTP")
})

////////////////////////////////////////////////////////////////////////////////
// Permet d'attacher le scope d'execution de la fonction � l'objet pass�        
////////////////////////////////////////////////////////////////////////////////
Function.prototype.bind = function(object) 
{
  var __method = this;
  return function() 
  {
    return __method.apply(object, arguments);
  }
}  

////////////////////////////////////////////////////////////////////////////////
/// Construction d'une structure SNVT.                                          
/// Cr�ation des propri�t�s et des m�thodes d'acc�s aux propri�t�s              
/// @param * Les noms des propri�t�s de la variable SNVT � cr�er                
/// @return un objet SNVT                                                       
//////////////////////////////////////////////////////////////////////////////// 
Snvt = function() 
{
	this.data = {}
	nb = arguments.length
	this.name = arguments[0]
	for(var i=1; i < nb; i++) 
	{			
		var key = arguments[i]   
		this.data[key] = 0
		this[key] = this.__callback(key)
	}
	return this
}
Snvt.prototype = 
{
	__callback: function(key) 
	{
		var obj = function(value, no_server_callback) 
		{			  
			if(value != undefined && value != this.data[key]) 
			{
				this.data[key] = value
				Server.subscribed[this.name]['on'+key]()
				if(!no_server_callback)Server.set(this)
			}
			return this.data[key]
		}
		return obj
	}
}

////////////////////////////////////////////////////////////////////////////////
/// Definition de l'objet SNVT_switch.                                          
/// @param name Nom de l'�l�ment HTML concern� i.e. <div id="name" ></div>      
/// @param varname Nom de la variable r�seau                                    
////////////////////////////////////////////////////////////////////////////////
SNVT_switch = function(name, varname) {
	if(!name || !varname) throw error_msg_1 
		
	// Propri�t�s de changement de style
	this.classOutOn   = ''
	this.classOutOff  = ''
	this.classOverOn  = ''
	this.classOverOff = ''
  
	// Nom de l'�l�ment
	this.name = name

	// Setter et Getter...
	this.snvt =  new Snvt(varname, 'state', 'value') 

	// Propri�t� d'identification
	this.node = document.getElementById(name)	
	
	// M�thode de changement de style...
	this.changecss = function() { 
		if(this.snvt.State())
			this.node.className = this.classOutOn
		else
			this.node.className = this.classOutOff
	}
	
	// Ev�nement lors d'un clic de souris
	this.onclick = function() 
	{
		this.snvt.state(!this.snvt.state()) 
	}
	
	// Ev�nement lors d'un survol de souris
	this.onmouseover = function() 
	{
		if(this.snvt.State() && this.classOverOn && this.classOverOff)
			this.node.className = this.classOverOn
		else
			this.node.className = this.classOverOff  
	}
	
	// Ev�nement lors d'une sortie du pointeur de souris
	this.onmouseout = function() 
	{
		if(this.snvt.State() && this.classOutOn && this.classOutOff)
			this.node.className = this.classOutOn
		else
			this.node.className = this.classOutOff  		
	}
	
	// Ev�nement lors d'un changement d'�tat
	this.onstate = function() 
	{
		if(this.snvt.State() && this.classOutOn && this.classOutOff)
			this.node.className = this.classOutOn
		else
			this.node.className = this.classOutOff  
	}
	
	// Ev�nement lors d'un changement de valeur
	this.onvalue = function() 
	{
		// Rien ne se passe...
	}                           	
	
	this.node.onclick = this.onclick.bind(this)
	this.node.onstate = this.onstate.bind(this) 
	this.node.onvalue = this.onvalue.bind(this) 	
	Server.subscribed[varname] = this
	//return this
}            
SNVT_switch.prototype = {
	snvt: {},
	
}    

////////////////////////////////////////////////////////////////////////////////
/// Dialogue avec le serveur LonTouch.                                          
////////////////////////////////////////////////////////////////////////////////
Server = {
	/**
	 * Adresse du serveur LonTouch
	 */
	url: 'http://192.168.1.55/lontouch/gateway.php?gi=16',
		  
	/**
	 * Interval de mise � jour [ms]
	 */
	updateTime: 100,
	
	/**
	 * Objet de dialogue avec le serveur
	 */
	http: new XMLHttpRequest(),

	/**
	 * Envoi d'une variable au serveur
	 */
	set: function(snvt) 
	{
		this.http.open("GET", this.url + this.toQuery(snvt), true);
		this.http.send(null);
	},
	
	/**
	 * R�ception de donn�es du serveur
	 */
	get: function() 
	{
		this.onReceive()
		this.http.open("GET", this.url + "&update", true);
		this.http.send(null);  
	},
		  
	/**
	 * Formatte la requ�te GET/HTTP
	 */
	toQuery: function(snvt) 
	{
		var query = '';
		for(var key in snvt.data) 
		{
			query += '&' + snvt.name + '.' + key + '=' + snvt.data[key];
		}
		//query = query.replace('&', '?');
		return query;
	}, 
				
	/**
	 * Callback lors de la r�ception des donn�es
	 */
	onReceive: function() 
	{		
		if(this.http.readyState == 4 && this.http.status == 200) 
		{ 
			var recvstr = Server.http.responseText  
			try 
			{
				eval("var json = "+recvstr)
				for(var lname in json) 
				{
					for(var vname in json[lname]) 
					{
					  this.subscribed[lname].snvt[vname](json[lname][vname], true)
					}
				}  
			} catch(e) 
			{
			}
		}
   },

	/**
	 * Liste des objets qui requiert un dialogue avec le serveur
	 */
	subscribed: {}, 
					
	/**
	 * Action effectu�e lors des intervalles de temps
	 */
	update: function update() 
	{
		this.get()
	},
	
	/** 
	 * Initialisation de l'objet de connexion
	 */
	start: function() 
	{
   	this.http.onreadystatechange = this.onReceive.bind(this)
		window.setInterval("Server.update()", this.updateTime)
	}         
}


////////////////////////////////////////////////////////////////////////////////
/// Emp�che la s�lection du texte de l'interface                                
//////////////////////////////////////////////////////////////////////////////// 
document.onselectstart = new Function("return false")

function deselect(e) 
{
	return false
}
function select() 
{
	return true;
}
