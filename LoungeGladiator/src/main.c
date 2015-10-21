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
#include "vida.h"
#include "draws.h"
#include "ia.h"
#include "CalcColision.h"
#include "keyboard.h"

/*INICIALIZACION*/
void init(){
   cpct_disableFirmware();
   cpct_setVideoMode(0);
   cpct_fw2hw(g_palette,4);
   cpct_setPalette(g_palette,4);
}

void initPlayer(){
  u8 *sprite = gladis_quieto_dcha;
  player.x = origins[0][0];
  player.y = origins[0][1];
  player.lx = origins[0][0];
  player.ly = origins[0][1];
  player.sprite = sprite;
  player.life = 3;
  player.dir = 6;
  player.atk = 20;
  player.latk = 20;
  player.bullets = 3;
}

void initEnemies(){
  u8 *sprite = chacho_dcha;
    enemy.x = origins[1][0];
    enemy.y = origins[1][1];
    enemy.lx = origins[1][0];
    enemy.ly = origins[1][1];
    enemy.ox = origins[1][0];
    enemy.oy = origins[1][1];
    enemy.sprite = sprite;
    enemy.life = 3;
    enemy.dir = 6;
    enemy.bullets = 3;
    enemy.room = 3;

}

/*GAME OVER*/
void gameOver(){
    u8* memptr;
  cpct_clearScreen(0);
  memptr = cpct_getScreenPtr(VMEM,10,10);
  cpct_drawStringM0("Lounge Gladiator",memptr,1,0);

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



/*Colisiones*/



void checkBoundsCollisionsEnemy(u8 *x,u8 *y, u8 lx, u8 ly,u8 sizeX,u8 sizeY){

  u8 *posX = x;
  u8 *posY = y;
  if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1
      || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
      || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 1
      || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
    ){
        *posX=lx;
        *posY=ly;
  }
   else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] != 3
      || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
      || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] != 3
      || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
    ){
      *posX=lx;
      *posY=ly;
  }

}


void checkBoundsCollisions(u8 *corazon,u8 *flecha){
 if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 1
      || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
      || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 1
      || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
    ){
        player.x=player.lx;
        player.y=player.ly;
  }
   else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 2
      || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
      || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 2
      || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
    ){
      if(player.life < 3 && *corazon == 0){
        player.life += 1;
        *corazon = 1;
      }
  }
  else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 5
      || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
      || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 5
      || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
    ){
      if(player.bullets < 3 && *flecha == 0){
        player.bullets += 1;
        *flecha = 1;
      }
  }else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 9
      || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
      || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 9
      || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9

    ){
        cpct_clearScreen(0);
        map+=1;
        drawMap(map);
  }
}

u8 checkArrowCollisions(){
    u8 auxX;
    u8 auxY;
    u8 bound =0;

    if(object.dir == 2 || object.dir == 8){
        auxX = 2;
        auxY = 8;
    }else{
        auxX = 4;
        auxY = 4;
    }

    if(    scene[(object.y)/auxY][(object.x)/auxX] == 1
      || scene[(object.y)/auxY][(object.x+auxX-1)/auxX] == 1
      || scene[(object.y+auxY-2)/auxY][(object.x)/auxX] == 1
      || scene[(object.y+auxY-2)/auxY][(object.x+auxX-1)/auxX] == 1
    ){
        object.x=object.lx;
        object.y=object.ly;
        bound = 1;
  }

  return bound;
}




void followPlayer(){
    u8 auxX, auxY;

    if(detectPlayerRoom(player.x,player.y) != enemy.room){
        auxX = enemy.seenX;
        auxY = enemy.seenY;
    }else{
        auxX = player.x;
        auxY = player.y;
    }
    /*u8 *memptr;
    memptr = cpct_getScreenPtr(VMEM,5,50);*/
    if(auxX < enemy.x){
        //cpct_drawSolidBox(memptr, 1, 2, 8);
        if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1){
            enemy.x-=1;
        }else if(auxY < enemy.y){
            if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
                enemy.y-=1;
        }else{
            if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
                enemy.y+=1;
        }
    }else if(auxX > enemy.x){
        //cpct_drawSolidBox(memptr, 10, 2, 8);
        if(scene[(enemy.y)/tileheight][(enemy.x+tilewidth)/tilewidth] != 1){
            enemy.x+=1;
        }else if(auxY < enemy.y){
            if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1)
                enemy.y-=1;
        }else{
            if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
            enemy.y+=1;
        }
    }else{
        //
        if(auxY < enemy.y){
            if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
                enemy.y-=1;
            }else{
                if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
                enemy.y+=1;
            }
    }
}

void patrol(){
  //scene[(y[0])/tileheight][(x[0])/tilewidth] = room;

  movement(enemy.dir);

  if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] != enemy.room
  || scene[(enemy.y)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
  || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x)/tilewidth] != enemy.room
  || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
  ){
    switch(enemy.dir){
    case 4:
        movement(6);
        break;
    case 6:
        movement(4);
        break;
    case 2:
        movement(8);
        break;
    case 8:
        movement(2);
        break;
    }
  }
  //scene[(y[0])/tileheight][(x[0])/tilewidth] = 2;
}

u8 vissionSensor(){
  u8 following = 0;
  u8 cx = enemy.x/tilewidth;
  u8 cy = enemy.y/tilewidth;
  u8 pcx = player.x/tilewidth;
  u8 pcy = player.y/tilewidth;
  u8 lex,mex,ley,mey;
  u8 i=0;
  for(i=0;i<3;i++){
    lex = cx - i;
    ley = cy - i;
    mex = cx + i;
    mey = cy + i;
    if(lex == pcx || ley == pcy || mex == pcx || mey == pcy){
      following = 1;
    }
  }

  return following;

}


void move(){
    //u8* memptr;
    if(temp > 10){
        enemy.dir = chooseDirection();
        following = detectPlayerRoom(player.x,player.y);
        /*memptr = cpct_getScreenPtr(VMEM,20,20);
        cpct_drawSolidBox(memptr, following, 2, 8);
        memptr = cpct_getScreenPtr(VMEM,24,20);
        cpct_drawSolidBox(memptr, enemy.room, 2, 8);*/
        if(following == enemy.room || enemy.pursue != 0){
            if(enemy.pursue == 0)
                enemy.pursue = 3;
            else if(enemy.pursue > 1)
                enemy.pursue -=1;
        }
        temp = 0;
    }else{
        if(enemy.pursue >= 1){
            followPlayer();
            if(enemy.seenX == enemy.x && enemy.seenY == enemy.y)
                enemy.pursue = 0;
        }else{
            patrol();
        }
    }
    if((detectPlayerRoom(enemy.lx,enemy.ly) == detectPlayerRoom(player.x,player.y)) || enemy.pursue > 1){
        enemy.seenX = player.x;
        enemy.seenY = player.y;
    }
    enemy.room = detectPlayerRoom(enemy.x,enemy.y);
    temp += 1;
}

/*JUEGO*/

void game(){
  u8 atkObj = 0;
  TNivel n = {0,0,0};
  bound =0;
  temp = 0;
  map = 1;
  arrow =0;
  finish =0;
  following =0;
  archer = 0;

  initPlayer();
  initEnemies();

   cpct_clearScreen(0);
   drawMap(map);
   //drawStats();

   //Volver a dibujar los stats cuando se mate a alguien


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
            enemy.x = enemy.ox;
            enemy.y = enemy.oy;
            enemy.life -= 1;
            break;
        case 2:
            player.x = 0;
            player.y = 80;
            player.life -= 1;
            if(player.life == 0){
                gameOver();
            }
            break;
        }
    }
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
        if(enemy.life > 0 && checkCollisions(object.x, object.y, enemy.x, enemy.y, atkObj) == 1){
            enemy.life -= 1;
            object.vivo = 0;
        }
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
