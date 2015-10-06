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
#include "gladis-arriba.h"
#include "gladis-atk.h"
#include "chacho-quieto.h"
#include "vida.h"
#include "flecha-horizontal.h"
#include "flecha-vertical.h"
#define VMEM (u8*)0xC000

typedef struct
{
  u8 x,y,prevX,prevY; //posicion personaje
  u8* atk; //auxiliares de posicion y sprite
  u8* prevAtk;
  u8* dir;
  u8* col;
  u8* rebote;
  u8* life;
}TPlayer;

typedef struct
{
  u8 x,y,prevX,prevY; //posicion enemigo
  u8* vivo; //control vida enemigo
  u8* dir;
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

//Detectar p.colision de personajes
u8* checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8* dir, u8* atk, u8 mode){


    u8 popX = pX + 8;
    u8 popY = pY + 16;
    u8 eopX = e8 + 8;
    u8 eopY = eY + 16;


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
    }
}

u8* checkSpriteFlecha(u8* dir){
    switch((int)dir){
        case 0:
            return flecha_dcha;
            break;
        case 1:
            return flecha_izda;
            break;
        case 2:
            return flecha_abajo;
            break;
        case 3:
            return flecha_arriba;
            break;
    }
}

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
   TPlayer p = { 0,100,0,100,20,20,0,0,6,3 };
   TEnemy  e = { 55,100,55,100,0,0 };
   TEnemy pr = { 0,0,0,0,1,0 };
   u8* memptr;
   u8* sprite = gladis_quieto_dcha;
   u8* auxCol;
   u8 i = 0;
   cpct_clearScreen(0);

   while (1){

    //Esperar el retrazado
    cpct_waitVSYNC();

    //Desdibujar personaje
    memptr = cpct_getScreenPtr(VMEM,p.prevX,p.prevY);
    if(p.prevAtk <= 20)
        cpct_drawSolidBox(memptr,0,4,16);
    else
        cpct_drawSolidBox(memptr,0,5,16);
    //Dibujar personajes
    memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
    //Si esta atacando dibujar un sprite, si no, otro
    if(p.atk >= 21)
        cpct_drawSpriteMasked(sprite, memptr, 5, 16);
    else
        cpct_drawSpriteMasked(sprite, memptr, 4, 16);

    //Desdibujar la vida
    memptr = cpct_getScreenPtr(VMEM,60,160);
    cpct_drawSolidBox(memptr,0,10,16);
    //Dibujar Vida
    drawVida(p.life, memptr);

    //Desdibujar el enemigo
    memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
    cpct_drawSolidBox(memptr,0,4,16);
    //Dibujar el enemigo solo si esta vivo
    if(e.vivo == 0){
        memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
        cpct_drawSolidBox(memptr, 18, 4, 16);
    }

    //Desdibujar flecha
    memptr = cpct_getScreenPtr(VMEM,pr.prevX,pr.prevY);
    if((int)pr.dir < 2)
        cpct_drawSolidBox(memptr, 0, 4, 4);
    else
        cpct_drawSolidBox(memptr, 0, 2, 8);
    //Dibujar flecha
    if(pr.vivo == 0){
        memptr = cpct_getScreenPtr(VMEM,pr.x,pr.y);
        if((int)pr.dir < 2)
            cpct_drawSpriteMasked(checkSpriteFlecha(pr.dir), memptr, 4, 4);
        else
            cpct_drawSpriteMasked(checkSpriteFlecha(pr.dir), memptr, 2, 8);
    }

    //Dibujar fatiga
    if(p.atk < 20)
        drawFatiga(p.atk,memptr,2);
    else if(p.atk > 20)
        drawFatiga(p.atk,memptr,16);
    else
        drawFatiga(p.atk,memptr,0);

    p.prevX = p.x;
    p.prevY = p.y;
    p.prevAtk = p.atk;
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
            }else if(cpct_isKeyPressed(Key_X) && pr.vivo == 1){
                pr.vivo = 0;
                pr.dir = p.dir;
                pr.x = p.x+4;
                pr.y = p.y+8;
            }else  if(cpct_isKeyPressed(Key_Esc)){
                return;
            }
        }
    }else{
        p.x -= 2;
        p.rebote -= 2;
        if(p.rebote == 0){
            p.rebote = 6;
            p.col = 0;
        }
      }

    //Comprobar si esta quieto para que no se dibuje el sprite de atacar//
    sprite = checkSprite(p.atk,p.dir);

    if(pr.vivo == 0){
        pr.prevX = pr.x;
        pr.prevY = pr.y;
        switch((int)pr.dir){
            case 0:
                if(pr.x<74)
                    pr.x++;
                else
                    pr.vivo = 1;
                break;
            case 1:
                if(pr.x > 0)
                    pr.x--;
                else
                    pr.vivo = 1;
                break;
            case 2:
                if(pr.y < 192)
                    pr.y+=2;
                else
                    pr.vivo = 1;
                break;
            case 3:
                if(pr.y > 0)
                    pr.y-=2;
                else
                    pr.vivo = 1;
                break;
        }
    }

    if(p.col != 2 && e.vivo == 0){
        p.col = checkCollisions(p.x,p.y,e.x,e.y,p.dir,p.atk,0);
        if(p.col == 2)
            p.life--;
            if(p.life == 0)
                return;
      }
      if(p.col == 1)
        e.vivo = 1;
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
