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
#include "muro.h"
#include "gladis.h"
#include "chacho-quieto.h"
#include "flecha.h"
#include "mapa.h"
#include "init.h"
#include "vida.h"
#include "draws.h"
#include "ia.h"
#include "CalcColision.h"
#include "keyboard.h"
#include "portada.h"


/*GAME OVER*/
void gameOver(){
    u8* memptr;
  cpct_clearScreen(0);
  memptr = cpct_getScreenPtr(VMEM,10,10);
  cpct_drawStringM0("Lounge Gladiator",memptr,1,0);

  memptr = cpct_getScreenPtr(VMEM,2,180);
   cpct_drawStringM0("Pulsa cualquier tecla",memptr,1,0);

  while(1){
    cpct_scanKeyboard_f();
    if(cpct_isAnyKeyPressed()) return;
  }
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
}

/*JUEGO*/

void game(){
  u8 atkObj = 0;

  initVariables(1);
  initPlayer(map);
  initNivel();
  initEnemies(map);


   cpct_clearScreen(0);
   drawMap(map);

   while (1){

    //Esperar el retrazado
    cpct_waitVSYNC();

    //Desdibujar personajes
    erases();

    //Dibujar pickups
    if(temp == 10)
        drawPickUps(n.corazon,n.bullet);

    //Dibujar personajes
    draws();

    //Dibujar fatiga
    if(temp == 10){
        if(player.atk < 20) drawFatiga(player.atk,2);
        else if(player.atk > 20) drawFatiga(player.atk,1);
        else drawFatiga(player.atk,0);
    }


    //guardar datos anteriores
    if(temp%2 == 0){
        player.lx = player.x;
        player.ly = player.y;
    }

    if(enemy.life > 0){
        if(temp%2 == 1){
            enemy.lx = enemy.x;
            enemy.ly = enemy.y;
        }

        move();

        switch(checkCollisions(player.x, player.y, enemy.x, enemy.y, player.atk)){
         case 1:
         erase(enemy.lx,enemy.ly,0);
         enemy.x = enemy.ox;
         enemy.y = enemy.oy;
         enemy.lx = enemy.x;
         enemy.ly = enemy.y;
         enemy.life -= 1;
         player.atk = 20;
         break;
         case 2:
         erase(player.lx,player.ly,0);
         player.x = 0;
         player.y = 80;
         player.lx = 0;
         player.ly = 80;
         player.life -= 1;
         player.atk = 20;
         enemy.pursue = 0;
         break;
         }
         enemy.room = detectPlayerRoom(enemy.x,enemy.y);
    }
    if(temp > 10)
        temp = 0;
    temp += 1;
    player.latk = player.atk;



      //Comprobar teclado
      cpct_scanKeyboard_f();
      player.sprite = checkKeyboard();
      checkBoundsCollisions(&n.corazon,&n.bullet);

      if(arrow == 1){
        moveObject();
        bound = checkArrowCollisions();
        if(object.dir == 2 || object.dir == 8)
            atkObj = 21;
        else
            atkObj = 22;
        if(enemy.life > 0 && checkCollisions(object.x, object.y, enemy.x, enemy.y, atkObj) == 1 && bound == 0){
            enemy.life -= 1;
            enemy.x = enemy.ox;
            enemy.y = enemy.oy;
            object.vivo = 0;
            bound = 1;
        }
      }

      if(player.life == 0){
        gameOver();
        finish = 1;
      }
      if(finish == 1) return;

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
      cpct_drawStringM0("Josep Domenech Mingot",memptr,1,0);
      cpct_drawStringM0("Alberto Martinez Martinez",memptr,1,0);

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
