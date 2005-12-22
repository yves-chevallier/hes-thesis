////////////////////////////////////////////////////////////////////////////////
///  _   _        _                            _                                
/// | | | |      |_|                          | |                               
/// | |_| |_____  _ _____           _     _ __| |                               
/// | |_  | ___ || |  _  \  _____  \ \  / // _  |                               
/// | | | | ____|| | |_| | (_____)  \ \/ /( (_| |                               
/// |_| |_|_____)|_|___  |           \__/  \____|                               
///                  __| | Haute Ecole d'Ingenieurs                             
///                 |___/  et de Gestion - Vaud                                 
///                                                                             
/// @title    LIBRAIRIE GENERIQUE DE TRAITEMENT DE FIFO OU LIFO                 
/// @context  Travail de diplôme                                                
/// @author   Y. Chevallier <nowox@kalios.ch>                                   
/// @file     databox.c                                                         
/// @language ASCII/C                                                           
/// @svn      $Id: databox.c 82 2005-12-14 05:41:51Z Canard $                   
////////////////////////////////////////////////////////////////////////////////
#define DATABOX
////////////////////////////////////////////////////////////////////////////////
/// Headers nécessaires                                                         
////////////////////////////////////////////////////////////////////////////////
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ossi.h>
#include "databox.h"

////////////////////////////////////////////////////////////////////////////////
/// Bloque l'accès une liste.                                                   
/// Permet de vérouiller l'accès à une liste par mutex                          
/// @param handler descripteur de la liste à vérouiller                         
///                                                                             
////////////////////////////////////////////////////////////////////////////////
void 
DataBoxLock (struct DataBoxHandler* handler) 
{
	OssiMutexObtain (handler->mutex, OSSI_WAIT_FOREVER);  	
}

////////////////////////////////////////////////////////////////////////////////
/// Débloque l'accès à une liste.                                               
/// Permet de débloquer une liste vérouillée avec DataBoxLock()                 
/// @param handler descripteur de la liste vérouillée                           
////////////////////////////////////////////////////////////////////////////////
void 
DataBoxUnlock (struct DataBoxHandler* handler) 
{
	OssiMutexRelease (handler->mutex);
}

////////////////////////////////////////////////////////////////////////////////
/// Comptabilise le nombre d'éléments dans une liste.                           
/// @param handler descripteur de la liste concernée                            
/// @return nombre d'éléments de la liste                                       
////////////////////////////////////////////////////////////////////////////////
int 
DataBoxElements (struct DataBoxHandler* handler) 
{
	return handler->elements;
}                                            

////////////////////////////////////////////////////////////////////////////////
/// Pousse un élément.                                                          
/// Permet d'ajouter un élément de la liste en le poussant depuis le premier    
/// élément.                                                                    
/// @param handler descripteur de la liste                                      
/// @param data données à transmettre                                           
////////////////////////////////////////////////////////////////////////////////
void 
DataBoxPush (struct DataBoxHandler* handler, void* data) 
{
	struct DataBoxStruct* slot;  
	slot = malloc(handler->sizeDataBoxStruct);	
	slot->data = malloc(handler->sizeDataBoxData); 
   memcpy(&(slot->data), data, handler->sizeDataBoxData);
	handler->elements++;		 	
	if (handler->first->tail == NULL) 
	{
		slot->tail = NULL; 
		slot->head = handler->first->tail;
		handler->first->tail = slot;   
	}
	else 
	{
		slot->tail = handler->first->tail; 
		slot->head = handler->first;		
		handler->first->tail = slot;
		slot->tail->head = slot;
	}
}

////////////////////////////////////////////////////////////////////////////////
/// Tire un élément.                                                            
/// Retire un élément depuis l'avant.                                           
/// @param handler descripteur de la liste                                      
/// @data pointeur sur les données reçues                                       
////////////////////////////////////////////////////////////////////////////////
void 
DataBoxPop (struct DataBoxHandler* handler, void* data) 
{	
	struct DataBoxStruct* lastStruct = handler->first->tail;  
	if (handler->first->tail != NULL) 
	{	  
		memcpy (data, handler->first->tail->data, handler->sizeDataBoxData);		
	   free (handler->first->tail->data);
		if (handler->first->tail->tail != NULL) 
		{
			handler->first->tail = handler->first->tail->tail;
			handler->first->tail->head = handler->first;
		}
		else 
		{
			handler->last = handler->first;
			handler->first->tail = NULL;
		}  
		free (lastStruct); 
		handler->elements--;		
	}
}  

////////////////////////////////////////////////////////////////////////////////
/// Ajoute un élément à la fin.                                                 
/// @param handler descripteur de la liste                                      
/// @param data pointeur sur les données à transmettre                          
////////////////////////////////////////////////////////////////////////////////
void 
DataBoxAppend (struct DataBoxHandler* handler, void* data) 
{	
	struct DataBoxStruct* slot;  
	slot = malloc(handler->sizeDataBoxStruct);
	slot->data = malloc(handler->sizeDataBoxData); 
	slot->tail = NULL;                                         
	slot->head = handler->last;	   
   memcpy (slot->data, data, handler->sizeDataBoxData);
	handler->last->tail = slot;    	
	handler->last = slot;     
	handler->elements++;
}  

////////////////////////////////////////////////////////////////////////////////
/// Mise à jour d'une donnée.                                                   
/// Met à jour la donnée pointée par le positionneur interne.                   
/// @param handler descripteur de la liste                                      
/// @param data pointeur sur les données à transmettre                          
/// @return 0 si réussite -1 si échec                                           
////////////////////////////////////////////////////////////////////////////////
int
DataBoxUpdate (struct DataBoxHandler* handler, void* data) 
{
   memcpy (handler->pointer->data, data, handler->sizeDataBoxData);  
	return 0; 
}

////////////////////////////////////////////////////////////////////////////////
/// Initialisation du pointeur interne.                                         
/// Positionne le pointeur d'élément interne sur le premier élément de la liste 
/// @param handler descripteur de la liste                                      
////////////////////////////////////////////////////////////////////////////////
void 
DataBoxReset (struct DataBoxHandler* handler) 
{  
	handler->pointer = handler->first->tail;   
}

////////////////////////////////////////////////////////////////////////////////
/// Efface un élément.                                                          
/// Efface un élément pointé par le pointeur d'élément interne.                 
/// @param handler descripteur de la liste                                      
////////////////////////////////////////////////////////////////////////////////
int 
DataBoxClearElement (struct DataBoxHandler* handler) 
{ 
	struct DataBoxStruct* lastStruct = handler->pointer;  
	
	if (handler->pointer == NULL) 
		return -1;    
	free (handler->pointer->data);
	if (handler->pointer->tail != NULL) 
	{
		handler->pointer->head->tail = handler->pointer->tail; 
		handler->pointer->tail->head = handler->pointer->head; 
	}
	else 
	{
		handler->pointer->head->tail = NULL;
	}    
	free (lastStruct); 
	handler->elements--;		 
	return 0; 
}

////////////////////////////////////////////////////////////////////////////////
/// Retourne une donnée pointée.                                                
/// Retourne les données pointées par le pointeur d'élément interne.            
/// @param handler descripteur de la liste                                      
/// @param data pointeur auquel vont être copiées les données                   
/// @return 0 si réussite -1 si échec                                           
////////////////////////////////////////////////////////////////////////////////
int 
DataBoxFetchElement (struct DataBoxHandler* handler, void* data) 
{  
	if (handler->pointer != NULL)
		memcpy (data, handler->pointer->data, handler->sizeDataBoxData); 
	else 
	{  
		data = NULL;
		return -1; 
	}  
	return 0; 
}

////////////////////////////////////////////////////////////////////////////////
/// Avance le pointeur.                                                         
/// Incrémente le pointeur d'élément interne de 1                               
/// @param handler descripteur de la liste                                      
////////////////////////////////////////////////////////////////////////////////
int 
DataBoxNext (struct DataBoxHandler* handler) 
{
	handler->pointer = handler->pointer->tail; 	
	if (handler->pointer == NULL) 
		return -1;
	return 0; 
}

////////////////////////////////////////////////////////////////////////////////
/// Positionne le pointeur de donnée.                                           
/// Place le pointeur d'élément interne à une position spécifiée                
/// @param handler descripteur de la liste                                      
/// @param pos nouvelle position du pointeur                                    
/// @return 0 si réussite, -1 si échec                                          
////////////////////////////////////////////////////////////////////////////////
int
DataBoxSeek (struct DataBoxHandler* handler, int pos) 
{
	int i; 
	handler->pointer = handler->first->tail; 
	if (handler->elements > pos)
		return -1; 
	for (i=0; i<pos; i++); 
		handler->pointer = handler->pointer->tail; 
	return 0; 
}

////////////////////////////////////////////////////////////////////////////////
/// Création d'une nouvelle liste.                                              
/// Initialisation et création d'une nouvelle liste doublement chaînée          
/// @param handler descripteur de la liste ainsi crée                           
/// @param sizeDataBoxData taille des données contenues dans la liste           
////////////////////////////////////////////////////////////////////////////////
void 
DataBoxCreate (struct DataBoxHandler* handler, int sizeDataBoxData) 
{
	handler->first = malloc(sizeof (struct DataBoxStruct));
	handler->first->data = NULL;
   handler->first->head = NULL;
	handler->first->tail = NULL;	
	handler->pointer = NULL; 
   handler->last = handler->first;	
	handler->sizeDataBoxData = sizeDataBoxData;
	handler->sizeDataBoxStruct = sizeof (struct DataBoxStruct);
	handler->elements = 0;
	OssiMutexCreate(&handler->mutex, 1);	
}

////////////////////////////////////////////////////////////////////////////////
/// Suppression d'une liste                                                     
/// @param handler                                                              
////////////////////////////////////////////////////////////////////////////////
void 
DataBoxDelete (struct DataBoxHandler* handler) 
{
	struct DataBoxStruct* slot; 	
	slot = handler->first;  	
	while (slot) 
	{
		free (slot); 		
		slot = slot->tail;
	}
}

////////////////////////////////////////////////////////////////////////////////
/// Affiche le contenu d'une liste.                                             
/// Parcours les éléments de la liste et appelle la fonction d'affichage pour   
/// afficher le contenu de la liste                                             
/// @handler descripteur de la liste                                            
/// @afficher fonction d'affichage reçevant la position de l'élément et les     
///           données                                                           
////////////////////////////////////////////////////////////////////////////////
void 
DataBoxPrint(struct DataBoxHandler* handler, void affichage(int, void*)) 
{
	int i = 0; 
	struct DataBoxStruct* slot; 	
	slot = handler->first->tail; 
   while (slot) 
	{
		i++;
	   affichage(i, slot->data); 
		slot = slot->tail;
	} 	
}           
