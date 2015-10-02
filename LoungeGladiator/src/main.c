//-----------------------------LICENSE NOTICE------------------------------------
//  This file is part of CPCtelera: An Amstrad CPC Game Engine
//  Copyright (C) 2015 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
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

#include <cpctelera.h>
#include <stdio.h>
#include "gladis-quieto.h"
#include "gladis-atk.h"
#include "chacho-quieto.h"



#define width 16
#define height 10

const u8 mapa[height][width] = {{1,1,1,1,0,1,1,1,0,1,1,0,1,1,1,1},
                                {1,1,1,1,0,1,1,1,0,1,1,0,0,0,1,1},
                                {1,1,1,1,0,1,1,1,0,1,1,0,1,0,1,1},
                                {1,1,1,1,0,1,1,1,0,1,1,0,1,0,1,1},
                                {1,1,1,1,0,0,0,0,0,0,0,0,1,0,1,1},
                                {1,1,1,1,0,1,1,1,0,1,1,1,1,0,1,1},
                                {1,1,1,1,0,1,1,1,0,1,1,1,1,0,1,1},
                                {1,1,1,1,0,1,1,1,0,1,1,1,1,0,1,1},
                                {1,1,1,1,0,1,1,1,0,0,0,0,0,0,1,1},
                                {1,1,1,1,0,1,1,1,0,1,1,1,1,1,1,1}};


#define VMEM (u8*)0xC000

typedef struct
{
  u8 x,y; //posicion personaje

}TPlayer;

typedef struct
{
  u8 x,y; //posicion enemigo
  u8 vivo; //control vida enemigo
}TEnemy;

const u8 g_palette[4] = { 0,26,6,18 };
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
   cpct_drawStringM0("Super Menu",memptr,2,3);

    memptr = cpct_getScreenPtr(VMEM,18,180);
   cpct_drawStringM0("Pulsa Intro",memptr,4,5);

   do{
    cpct_scanKeyboard_f();
   }while(!cpct_isKeyPressed(Key_Enter));

}

//Detectar colision de personajes
u8* checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8* dir, u8* atk){
    if(atk >= 21)
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
        if(eX - pX > 0 && eX - pX < 4)
            return 2;

    return 0;
}

u8* checkSprite(u8* atk, u8* dir){
    if(atk <= 20)
        if(dir == 0)
            return gladis_quieto_dcha;
        else
            return gladis_quieto_izda;
    else if(dir == 0){
        return gladis_atk_dcha;
    }else{
        return gladis_atk_izda;
    }
}





/*MAPA*/
void drawMap(){
   u8 posX=0,posY =0;
   u8* memptr;
   
   for(posY=0; posY<height;posY++){
      for(posX=0; posX<width;posX++){
         memptr = cpct_getScreenPtr(VMEM, posX*5, posY*20); 
         if(mapa[posY][posX] == 1){
            cpct_drawSolidBox(memptr, 3, 5, 20);
         }
      }
   }
}



/*JUEGO*/

void game(){
   TPlayer p = { 0,100 };
   TEnemy  e = { 55,100,0 };
   u8* memptr;
   u8* sprite = gladis_quieto_dcha;
   u8* dir = 0;
   u8* atk = 20;
   u8* col = 0;
   u8* rebote = 6;
   u8 i = 0;
   cpct_clearScreen(0);
    drawMap();
   while (1){

      //Esperar el retrazado
      cpct_waitVSYNC();

      //Desdibujar personaje
      memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
      if(atk <= 20)
        cpct_drawSolidBox(memptr,0,4,16);
      else
        cpct_drawSolidBox(memptr,0,5,16);

      memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
      if(e.vivo == 0)
        cpct_drawSolidBox(memptr,0,4,16);

      //Comprobar teclado, no se comprobara si ha chocado con un enemigo
      if(col != 2){
        cpct_scanKeyboard_f();
        if(cpct_isKeyPressed(Key_Space) && atk >= 20){
            if(atk >= 50)
                atk = 0;
            else
                atk += 1;
        if(cpct_isKeyPressed(Key_CursorRight))
                dir = 0;
        else if(cpct_isKeyPressed(Key_CursorLeft))
                dir = 1;
        }else{
            if(atk < 20)
                atk += 1;
            else
                atk = 20;
            if(cpct_isKeyPressed(Key_CursorRight) && p.x < 76 ){
                if(col != 2)
                    p.x += 1;
                dir = 0;
            }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
                if(col != 2)
                    p.x -= 1;
                dir = 1;
            }else  if(cpct_isKeyPressed(Key_Esc)){
                return;
            }
        }
      }else{
        p.x -= 2;
        rebote -= 2;
        if(rebote == 0){
            rebote = 6;
            col = 0;
        }
      }

      //Comprobar si esta quieto para que no se dibuje el sprite de atacar
        sprite = checkSprite(atk,dir);

      if(col != 2 && e.vivo == 0)
        col = checkCollisions(p.x,p.y,e.x,e.y,dir,atk);
      if(col == 1)
        e.vivo = 1;

      //Dibujar personajes
      memptr = cpct_getScreenPtr(VMEM,p.x,p.y);

      //Si esta atacando dibujar un sprite, si no, otro
      if(atk >= 21)
        cpct_drawSpriteMasked(sprite, memptr, 5, 16);
      else
        cpct_drawSpriteMasked(sprite, memptr, 4, 16);

      //Dibujar el enemigo solo si esta vivo
      if(e.vivo == 0){
        memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
        cpct_drawSolidBox(memptr, 18, 4, 16);
      }

      memptr = cpct_getScreenPtr(VMEM, 6, 10);
      cpct_drawStringM0("FATIGA",memptr, 2, 0);

      if(atk >= 21)
      for(i=0; i<(*atk - 20)/10; i++){
        memptr = cpct_getScreenPtr(VMEM, 18+i*4, 10);
        cpct_drawSolidBox(memptr, 18, 3, 10);
      }
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
