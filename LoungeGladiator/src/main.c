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
#include <time.h>
#include <stdlib.h>
#include <string.h>
#include <cpctelera.h>
#include "gladis.h"
#include "chacho-quieto.h"
#include "flecha.h"
#include "mapa.h"
#include "ia.h"



/*INICIALIZACION*/
void init(){
   cpct_disableFirmware();
   cpct_setVideoMode(0);
   cpct_fw2hw(g_palette,4);
   cpct_setPalette(g_palette,4);
}

/*MENU*/
int menu(){
   u8* memptr;
   int init = 50;
   int pushed =0;
   int cont =0;
   cpct_clearScreen(0);

   memptr = cpct_getScreenPtr(VMEM,10,10);
   cpct_drawStringM0("Lounge Gladiator",memptr,1,0);

   //Opciones 
   memptr = cpct_getScreenPtr(VMEM,20,50);
   cpct_drawStringM0("Nueva Partida",memptr,1,0);

   memptr = cpct_getScreenPtr(VMEM,20,70);
   cpct_drawStringM0("Creditos",memptr,1,0);

   memptr = cpct_getScreenPtr(VMEM,20,90);
   cpct_drawStringM0("Salir",memptr,1,0);

    /*memptr = cpct_getScreenPtr(VMEM,18,180);
   cpct_drawStringM0("Pulsa Intro",memptr,4,5);*/

   //Indicador
   


   while(1){
    
      cpct_scanKeyboard();
      if(cpct_isKeyPressed(Key_CursorDown) && cont > 150){
        cpct_drawSolidBox(memptr, 0, 2, 8);
        pushed ++;
        cont =0;
      }
      if(cpct_isKeyPressed(Key_CursorUp) && cont > 150){
        cpct_drawSolidBox(memptr, 0, 2, 8);
        pushed --;
        cont = 0;
      }

      switch (pushed){
        case 0: init = 50;break;
        case 1: init = 70;break;
        case 2: init = 90;break;
      }
      memptr = cpct_getScreenPtr(VMEM,15,init);
      cpct_drawSolidBox(memptr, 3, 2, 8);
      if(cpct_isKeyPressed(Key_Enter)){
        switch (pushed){
        case 0: return 1;break;
        case 1: return 2;break;
        case 2: return 0;break;
      }
      }
      cont++;
     
    
      
   }

   /*
   do{
    
   }while(!cpct_isKeyPressed(Key_Enter));
  */
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
         memptr = cpct_getScreenPtr(VMEM, posX*tilewidth, posY*tileheight); 
         if(scene[posY][posX] == 1){
            cpct_drawSolidBox(memptr, 3, tilewidth, tileheight);
         }
         if(scene[posY][posX] == 9){
            cpct_drawSolidBox(memptr, 9, tilewidth, tileheight);
         }
      }
   }
}

/*OBJETOS*/

void drawObjects(){
  int posX=0,posY =0;
  u8* memptr;
   for(posY=0; posY<height;posY++){
      for(posX=0; posX<width;posX++){
         memptr = cpct_getScreenPtr(VMEM, posX*tilewidth, posY*tileheight);
         if(scene[posY][posX] == 5){
            cpct_drawSpriteMasked(flecha_abajo,memptr,4,4);
         }
         if(scene[posY][posX] == 6){
            cpct_drawSolidBox(memptr, 6, tilewidth, tileheight);
         }
      }
   }
}

/*Dibujar Personajes*/
void cleanScreenPlayers(TPlayer *p,TPlayer *e){
  u8* memptr;
  if(p->life > 0){
    memptr = cpct_getScreenPtr(VMEM,p->lx,p->ly);
    cpct_drawSolidBox(memptr,0,p->size,16);
  }
  if(e->life > 0 ){
    memptr = cpct_getScreenPtr(VMEM,e->lx,e->ly);
    cpct_drawSolidBox(memptr,0,e->size,16);

  }      
}

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

void initPlayers(){

}

/*Colisiones*/


u8 checkBoundsCollisions(u8 *x,u8 *y, u8 lx, u8 ly){

  u8 *posX = x;
  u8 *posY = y;
  u8 bound = 0;
  if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1   
      || scene[(posY[0])/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 1
      || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 1 
      || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 1
    ){   
        *posX=lx;
        *posY=ly;
        bound = 1;
  }
  else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 6   
      || scene[(posY[0])/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 6
      || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 6
      || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 6
    ){   
       //Sumar corazones
  }else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 5   
      || scene[(posY[0])/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 5
      || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 5
      || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 5
    ){   
        //Sumar municion
  }else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 9   
      || scene[(posY[0])/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 9
      || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 9
      || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 9
    ){   
        cpct_clearScreen(0);
        drawMap(2);
  }
  return bound;
}

void checkArrowCollisions(u8 *x,u8 *y, u8 *vivo,u8 w,u8 h){

  u8 *posX = x;
  u8 *posY = y;
  if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1   
      || scene[(posY[0])/tileheight][(posX[0]+w-1)/tilewidth] == 1
      || scene[(posY[0]+h-2)/tileheight][(posX[0])/tilewidth] == 1 
      || scene[(posY[0]+h-2)/tileheight][(posX[0]+w-1)/tilewidth] == 1
    ){   
        vivo = 1;
  }
}

void checkEnemiesCollisions(){


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
         sprite = gladis_arriba_dcha;
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


u8* move(u8 *x,u8 *y,u8 *s,u8 bound,u8 *dir,u8 *size){
  int px = x[0];
  int py = y[0];
  u8 *sprite = s;
    
    if(bound == 1){
        switch(dir[0]){
          case 2: 
                dir[0] = 8;
                y[0] -= 2;
          break;
          case 6:
                dir[0] = 4;
                x[0] -= 1;
          break;
          case 8:
                dir[0] = 6;
                y[0] += 2;
          break;
          case 4:
                dir[0] = 6;
                x[0] += 1;
          break;
        }
    }
    else{
      int rnd = (rand()%4)+1;
      if(rnd == 4){
        px +=1;
        if(scene[py/tileheight][px/tilewidth] == 2 ){
          sprite = chacho_quieto_dcha;
           x[0] += 1;
           dir[0] = 6;
           size[0] = 4;
        }
      }else if(rnd == 3){
       px -=1;
       if(scene[py/tileheight][px/tilewidth] == 2 ){
          sprite = chacho_quieto_izda;
          x[0] -= 1;
           dir[0] = 4;
           size[0] = 4;
        }
      }else if(rnd == 2){
       py -=1;
       if(scene[py/tileheight][px/tilewidth] == 2 ){
           y[0] += 2;
           dir[0] = 2;
           size[0] = 4;
        }
      }else if(rnd == 1){
        py +=1;
        if(scene[py/tileheight][px/tilewidth] == 2 ){
          y[0] -= 2;
           dir[0] = 8;
           size[0] = 4;
        }
      }
    }
   


     return sprite;

}
/*Crear Personaje*/

TPlayer *create_Player(u8 x,u8 y,u8 *sprite,u8 life,u8 dir,u8 size){
   TPlayer *player = malloc(sizeof *player);
  assert(player != NULL);

  player->x = x;
  player->y = y;
  player->sprite = sprite;
  player->life = life;
  player->dir = dir;
  player->size = size;

  return player;
}

/*Mostrar Texto por Pantalla*/

void drawSomething(){

}

/*JUEGO*/

void game(){  
  TPlayer *p = create_Player(0,80,gladis_quieto_dcha,10,6,4);
  TPlayer *e = create_Player(15,120,chacho_quieto_dcha,10,6,4);
   //u8 i = p->x;

   //u8* memptr;
   int finish = 0,i=1;
    //u8* memptr;
   u8 bound =0;;
   
    


   cpct_clearScreen(0);
   drawMap(i);

   while (1){
      
      //Esperar el retrazado
      cpct_waitVSYNC();

      //Desdibujar personaje   
      cleanScreenPlayers(p,e);

      //Dibujar personaje 
      drawPlayers(p,e);

      //Dibujar objetos

      //drawObjects();

      //guardarposicion anterior;
      p->lx = p->x;
      p->ly = p->y;
      e->lx = e->x;
      e->ly = e->y;

      //Comprobar teclado
      cpct_scanKeyboard_f();
      p->sprite  = checkKeyboard(&p->x,&p->y,&finish,p->sprite,&p->dir,&p->size);
      e->sprite = move(&e->x,&e->y,e->sprite,bound,&e->dir,&e->size);
      
      //Comprobar colisiones
      checkBoundsCollisions(&p->x,&p->y,p->lx,p->ly);
      bound = checkBoundsCollisions(&e->x,&e->y,e->lx,e->ly);
      //checkEnemiesCollisions();
      
      

     if(finish == 1) {
        free(p);
        free(e);
        return;
      }

   }
}


/* CREDITOS */
void credits(){
  u8* memptr;
  cpct_clearScreen(0);
  memptr = cpct_getScreenPtr(VMEM,10,10);
  cpct_drawStringM0("Lounge Gladiator",memptr,1,0);  

  while (1){
      
      cpct_scanKeyboard_f();
     
      

     if(cpct_isKeyPressed(Key_Esc)) {
       
        return;
      }

   }
}
/*EMPIEZA EL CODIGO*/

void main(void) {
  int x =0;
   init();
  
   // Loop forever
   while(1){
      x=menu();
      switch(x){
        case 0: return;break;
        case 1: game(); break;
        case 2: credits();break;
      }
   }
      
}
