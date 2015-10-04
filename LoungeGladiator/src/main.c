//-----------------------------LICENSE NOTICE------------------------------------
//  This file is part of CPCtelera: An Amstrad CPC Game Engine
//  Copyright (C) 2015 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
//
//  This program is free softilewidthare: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Softilewidthare Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//------------------------------------------------------------------------------

#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <string.h>
#include <cpctelera.h>
#include "gladis-quieto.h"
#include "gladis-atk.h"
#include "chacho-quieto.h"
#include "mapa.h"

/*INICIALIZACION*/
void init(){
   cpct_disableFirmware();
   cpct_setVideoMode(0);
   cpct_fw2hw(g_palette,4);
   cpct_setPalette(g_palette,4);
}

/*MENU*/
void menu(){
   u8* memptr;
   cpct_clearScreen(0);

   memptr = cpct_getScreenPtr(VMEM,20,10);
   cpct_drawStringM0("MENU",memptr,2,3);

    memptr = cpct_getScreenPtr(VMEM,18,180);
   cpct_drawStringM0("Pulsa Intro",memptr,4,5);
   
   do{
    cpct_scanKeyboard_f();
   }while(!cpct_isKeyPressed(Key_Enter));

}


/*MAPA*/
void drawMap(int t){
   int posX=0,posY =0,x=0;
   u8* memptr;

   if(t == 1){ 
    for(x=0;x<height;x++){
      scene[x] = mapa1[x];
    }
  }

  if(t == 2){ 
    for(x=0;x<height;x++){
      scene[x] = mapa2[x];
    }
  }
   
   for(posY=0; posY<height;posY++){
      for(posX=0; posX<width;posX++){
         memptr = cpct_getScreenPtr(VMEM, posX*5, posY*20); 
         if(scene[posY][posX] == 1){
            cpct_drawSolidBox(memptr, 3, 5, 20);
         }
      }
   }
}

/*Dibujar personajes*/

void drawPlayers(TPlayer *p,TPlayer *e){
  u8* memptr;
  if(p->life > 0){
    memptr = cpct_getScreenPtr(VMEM,p->x,p->y);
    cpct_drawSpriteMasked(p->sprite,memptr,p->size,16);
  }
  if(e->life > 0 ){
    memptr = cpct_getScreenPtr(VMEM,e->x,e->y);
    cpct_drawSpriteMasked(e->sprite,memptr,e->size,16);
  }
}

/*Colisiones*/


void checkColisions(u8 *x,u8 *y, u8 lx, u8 ly){

  u8 *posX = x;
  u8 *posY = y;
  /*if((scene[(posX)/tilewidth][(posY)/tileheight]==1)
   ||(scene[(posX+playerwidth-1)/tilewidth][(posY)/tileheight]==1) 
   ||(scene[(posX+playerwidth-1)/tilewidth][(posY+playerheight-2)/tileheight]==1) 
   ||(scene[(posX)/tilewidth][(posY+playerheight-2)/tileheight]==1)){
      
      *posX=lx;
      *posY=ly;
     
   }*/ 

  if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1   
      || scene[(posY[0])/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 1
      || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 1 
      || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 1
    ){   
  
        *posX=lx;
        *posY=ly;
  }

}

/*Teclado*/

u8* checkKeyboard(u8 *x, u8 *y,int *finish,u8 *s,u8 *dir,u8 *size){
  
      u8 *sprite = s;
      if(cpct_isKeyPressed(Key_CursorRight) && x[0] < 76 ){
         x[0] += 1;
         dir[0] = 6;
         size[0] = 4;
         sprite = gladis_quieto_dcha;
      }else if(cpct_isKeyPressed(Key_CursorLeft) && x[0] > 0 ){
         x[0] -= 1;
         dir[0] = 4;
         size[0] = 4;
         sprite = gladis_quieto_izda;
      }else  if(cpct_isKeyPressed(Key_CursorDown) && y[0] < 180){
         y[0] += 2;
         dir[0] = 2;
         size[0] = 4;
         sprite = gladis_quieto_dcha;
      }else if(cpct_isKeyPressed(Key_CursorUp) && y[0] > 0 ){
         y[0] -= 2;
         dir[0] = 8;
         size[0] = 4;
         sprite = gladis_quieto_dcha;
      }else  if(cpct_isKeyPressed(Key_Esc)){
         finish[0] = 1;
      }else if(cpct_isKeyPressed(Key_Space)){
          size[0] = 5;
          if(dir[0] == 6) {sprite = gladis_atk_dcha;}
          else if(dir[0] == 4) {sprite = gladis_atk_izda;}
          else {sprite = gladis_quieto_dcha;} 
      }
      return sprite;
}


/*Crear Personaje*/
TPlayer *create_Player(u8 x,u8 y,u8 *sprite,u8 life,u8 dir,u8 size){
   TPlayer *player = calloc(1,sizeof *player);
  assert(player != NULL);

  player->x = x;
  player->y = y;
  player->sprite = sprite;
  player->life = life;
  player->dir = dir;
  player->size = size;

  return player;
}

/*JUEGO*/

void game(){
   /*TPlayer p = {0,100,gladis_quieto_dcha,10,6,4};
   TPlayer e = {30,100,gladis_quieto_dcha,5,4,4};*/

  TPlayer *players;
  players = calloc(1,sizeof players[0]);
 

  TPlayer *p = create_Player(0,100,gladis_quieto_dcha,10,6,4);
  TPlayer *e = create_Player(10,110,chacho_quieto_dcha,10,6,4);
  
 

   u8* memptr;
   int i =1;
   int finish = 0;
   
   u8 lx,ly;


   cpct_clearScreen(0);
   drawMap(i);

   while (1){
      
      //Esperar el retrazado
      cpct_waitVSYNC();

      //Desdibujar personaje   
      memptr = cpct_getScreenPtr(VMEM,p->x,p->y);
      cpct_drawSolidBox(memptr,0,p->size,16);


      //guardarposicion anterior;

      lx = p->x;
      ly = p->y;

      //Comprobar teclado
      cpct_scanKeyboard_f();
      p->sprite  = checkKeyboard(&p->x,&p->y,&finish,p->sprite,&p->dir,&p->size);

      //Comprobar colisiones
      checkColisions(&p->x,&p->y,lx,ly);

      //Dibujar personaje 
      drawPlayers(p,e);
      /*memptr = cpct_getScreenPtr(VMEM,p->x,p->y);
      cpct_drawSpriteMasked(p->sprite,memptr,p->size,16);
      memptr = cpct_getScreenPtr(VMEM,e->x,e->y);
      cpct_drawSpriteMasked(e->sprite,memptr,e->size,16);*/

     if(finish == 1) {return;}

   }
}



/*MAPA*/

void loadMap(){
  
}


/*EMPIEZA EL CODIGO*/

void main(void) {

   init();
   //loadMap();
   // Loop forever
  
   while(1){
      menu();

      game();
   }
      
}
