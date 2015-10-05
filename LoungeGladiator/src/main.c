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
#include "gladis-quieto.h"
#include "gladis-arriba.h"
#include "gladis-atk.h"
#include "chacho-quieto.h"
<<<<<<< HEAD
#include "mapa.h"
#include "ia.h"



=======
#include "vida.h"
#define VMEM (u8*)0xC000

typedef struct
{
  u8 x,y; //posicion personaje
  u8* atk; //auxiliares de posicion y sprite
  u8* dir;
  u8* col;
  u8* rebote;
  u8* life;
}TPlayer;

typedef struct
{
  u8 x,y; //posicion enemigo
  u8* vivo; //control vida enemigo
  u8* dir;
}TEnemy;

const u8 g_palette[4] = { 0,26,6,18 };
>>>>>>> 100f2f53c950a4f5642a7437e7ddf52df6d2a2ee
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

<<<<<<< HEAD

/*MAPA*/
void drawMap(int t){
   int posX=0,posY =0,x=0;
   u8* memptr;

   if(t == 1){ 
    for(x=0;x<height;x++){
      scene[x] = mapa1[x];
=======
//Detectar p.colision de personajes
u8* checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8* dir, u8* atk){
    if((u8)atk >= 21)
        if(dir == 0)
            if(eX - pX > -1 && eX - pX < 11)
                return 1;
            else
                return 0;
        else
            if(pX - eX > -1 && pX - eX < 11)
                return 1;
            else
                return 0;
    else
        if(eX - pX > 0 && eX - pX < 4 && eY - pY > 0 && eY - pY < 16)
            return 2;

    return 0;
}

u8* checkSprite(u8* atk, u8* dir){
    if(atk <= 20)
        switch((int)dir){
        case 0:
            return gladis_quieto_dcha;
            break;
        case 1:
            return gladis_quieto_izda;
            break;
        case 2:
            return gladis_quieto_dcha;
            break;
        case 3:
            return gladis_arriba_dcha;
        }
    else if(dir == 0){
        return gladis_atk_dcha;
    }else{
        return gladis_atk_izda;
>>>>>>> 100f2f53c950a4f5642a7437e7ddf52df6d2a2ee
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
         if(scene[posY][posX] == 5){
            cpct_drawSolidBox(memptr, 5, tilewidth, tileheight);
         }
         if(scene[posY][posX] == 6){
            cpct_drawSolidBox(memptr, 6, tilewidth, tileheight);
         }
      }
   }
}

<<<<<<< HEAD
/*Dibujar Personajes*/
void cleanScreenPlayers(TPlayer *p,TPlayer *e){
  u8* memptr;
  if(p->life > 0){
    memptr = cpct_getScreenPtr(VMEM,p->x,p->y);
    cpct_drawSolidBox(memptr,0,p->size,16);
  }
  if(e->life > 0 ){
    memptr = cpct_getScreenPtr(VMEM,e->x,e->y);
    cpct_drawSolidBox(memptr,0,e->size,16);

  }      
}
=======
//Dibujar las tres barras de fatiga cuando el jugador ataca
void drawFatiga(u8* atk, u8* memptr, u8 col){
    if(atk < 20)
        col = 2;
    if(atk > 30 || atk <= 20){
        memptr = cpct_getScreenPtr(VMEM,4,160);
        cpct_drawSolidBox(memptr, col, 2, 8);
    }
    if(atk > 40 || atk <= 20){
        memptr = cpct_getScreenPtr(VMEM,7,160);
        cpct_drawSolidBox(memptr, col, 2, 8);
    }
    if(atk <= 20){
        memptr = cpct_getScreenPtr(VMEM,10,160);
        cpct_drawSolidBox(memptr, col, 2, 8);
    }
}

//dibujar los corazones de vida del personaje
void drawVida(u8* life, u8* memptr){
    if(life >= 1){
        memptr = cpct_getScreenPtr(VMEM,55,160);
        cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
    }
    memptr = cpct_getScreenPtr(VMEM,60,160);
    if(life >= 2)
        cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
    else
        cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
    memptr = cpct_getScreenPtr(VMEM,65,160);
    if(life >= 3)
        cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
    else
        cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);

}

/*JUEGO*/

void game(){
   TPlayer p = { 0,100,20,0,0,6,3 };
   TEnemy  e = { 55,100,0,0 };
   TEnemy pr = { 0,0,1,0 };
   u8* memptr;
   u8* sprite = gladis_quieto_dcha;
   u8* auxCol;
   u8 i = 0;
   cpct_clearScreen(0);
>>>>>>> 100f2f53c950a4f5642a7437e7ddf52df6d2a2ee

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

<<<<<<< HEAD
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
  if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 6   
      || scene[(posY[0])/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 6
      || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 6
      || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 6
    ){   
        cpct_clearScreen(0);
        drawMap(2);
  }
  return bound;
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
=======
      //Desdibujar personaje
      memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
      if(p.atk <= 20)
        cpct_drawSolidBox(memptr,0,4,16);
      else
        cpct_drawSolidBox(memptr,0,5,16);

      memptr = cpct_getScreenPtr(VMEM,55,160);
      cpct_drawSolidBox(memptr,0,10,16);

      memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
      if(e.vivo == 0)
        cpct_drawSolidBox(memptr,0,4,16);

      //Comprobar teclado, no se comprobara si ha chocado con un enemigo
      if(p.col != 2){
        cpct_scanKeyboard_f();
        if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
            if(p.atk >= 50)
                p.atk = 0;
            else
                p.atk += 1;
        if(cpct_isKeyPressed(Key_CursorRight))
                p.dir = 0;
        else if(cpct_isKeyPressed(Key_CursorLeft))
                p.dir = 1;
        }else{
            if(p.atk < 20)
                p.atk += 1;
            else
                p.atk = 20;
            if(cpct_isKeyPressed(Key_CursorRight) && p.x < 76 ){
                if(p.col != 2)
                    p.x += 1;
                p.dir = 0;
            }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
                if(p.col != 2)
                    p.x -= 1;
                p.dir = 1;
            }else if(cpct_isKeyPressed(Key_CursorDown) && p.y < 184 ){
                p.y += 2;
                p.dir = 2;
            }else if(cpct_isKeyPressed(Key_CursorUp) && p.y > 0 ){
                p.y -= 2;
                p.dir = 3;
            }else  if(cpct_isKeyPressed(Key_Esc)){
                return;
            }
>>>>>>> 100f2f53c950a4f5642a7437e7ddf52df6d2a2ee
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
   


<<<<<<< HEAD
     return sprite;
=======
      if(p.col != 2 && e.vivo == 0){
        p.col = checkCollisions(p.x,p.y,e.x,e.y,p.dir,p.atk);
        if(p.col == 2)
            p.life--;
            if(p.life == 0)
                return;
      }
      if(p.col == 1)
        e.vivo = 1;
>>>>>>> 100f2f53c950a4f5642a7437e7ddf52df6d2a2ee

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
   
   
   u8 lx,ly,lex,ley;

   //u8* memptr;
   u8 bound =0;;
   
    


   cpct_clearScreen(0);
   drawMap(i);

   while (1){
      
      //Esperar el retrazado
      cpct_waitVSYNC();
      //Desdibujar personaje   
      cleanScreenPlayers(p,e);
      //guardarposicion anterior;
      lx = p->x;
      ly = p->y;
      lex = e->x;
      ley = e->y;
      //Comprobar teclado
      cpct_scanKeyboard_f();
      p->sprite  = checkKeyboard(&p->x,&p->y,&finish,p->sprite,&p->dir,&p->size);
      e->sprite = move(&e->x,&e->y,e->sprite,bound,&e->dir,&e->size);
      //Comprobar colisiones
      checkBoundsCollisions(&p->x,&p->y,lx,ly);
      bound = checkBoundsCollisions(&e->x,&e->y,lex,ley);
      //checkEnemiesCollisions();
      //Dibujar personaje 
      drawPlayers(p,e);
      

     if(finish == 1) {
      free(p);
      free(e);
      return;}

<<<<<<< HEAD
=======
      //Dibujar el enemigo solo si esta vivo
      if(e.vivo == 0){
        memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
        cpct_drawSolidBox(memptr, 18, 4, 16);
      }

    if(p.atk < 20)
        drawFatiga(p.atk,memptr,2);
    else if(p.atk > 20)
        drawFatiga(p.atk,memptr,16);
    else
        drawFatiga(p.atk,memptr,0);

    drawVida(p.life, memptr);
>>>>>>> 100f2f53c950a4f5642a7437e7ddf52df6d2a2ee
   }

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
