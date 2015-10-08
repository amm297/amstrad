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
#include "vida.h"
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
void drawMap(u8 t){
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

/*PERSONAJES*/

void drawPlayer(u8 x,u8 y,u8 *sprite,u8 size){
  u8* memptr;
  //if(p.life > 0){
    memptr = cpct_getScreenPtr(VMEM,x,y);
    cpct_drawSpriteMasked(sprite, memptr, size, 16);
  //}
}

void erasePlayer(u8 x,u8 y,u8 size){
  u8* memptr;
  //if(p.life > 0){
    memptr = cpct_getScreenPtr(VMEM,x,y);
    cpct_drawSolidBox(memptr,0,size,16);
  //}
}


/*FATIGA*/

void drawFatiga(u8 atk, u8 col){
  u8* memptr;
    if(atk < 20)
        col = 2;
    if(atk > 30 || atk <= 20){
        memptr = cpct_getScreenPtr(VMEM,4,192);
        cpct_drawSolidBox(memptr, col, 2, 8);
    }
    if(atk > 40 || atk <= 20){
        memptr = cpct_getScreenPtr(VMEM,7,192);
        cpct_drawSolidBox(memptr, col, 2, 8);
    }
    if(atk <= 20){
        memptr = cpct_getScreenPtr(VMEM,10,192);
        cpct_drawSolidBox(memptr, col, 2, 8);
    }
}

/*VIDA*/
void drawVida(u8 life){
  u8* memptr;
    if(life >= 1){
        memptr = cpct_getScreenPtr(VMEM,65,192);
        cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
    }
    memptr = cpct_getScreenPtr(VMEM,70,192);
    if(life >= 2)
        cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
    else
        cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
    memptr = cpct_getScreenPtr(VMEM,75,192);
    if(life >= 3)
        cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
    else
        cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);

}

/*Colisiones*/


u8 checkBoundsCollisions(u8 *x,u8 *y, u8 lx, u8 ly,u8 size){

  u8 *posX = x;
  u8 *posY = y;
  u8 bound = 0;
  if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1
      || scene[(posY[0])/tileheight][(posX[0]+size-1)/tilewidth] == 1
      || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 1
      || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+size-1)/tilewidth] == 1
    ){
        *posX=lx;
        *posY=ly;
        bound = 1;
  }
  else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 6
      || scene[(posY[0])/tileheight][(posX[0]+size-1)/tilewidth] == 6
      || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 6
      || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+size-1)/tilewidth] == 6
    ){
       //Sumar corazones
  }else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 5
      || scene[(posY[0])/tileheight][(posX[0]+size-1)/tilewidth] == 5
      || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 5
      || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+size-1)/tilewidth] == 5
    ){
        //Sumar municion
  }else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 9
      || scene[(posY[0])/tileheight][(posX[0]+size-1)/tilewidth] == 9
      || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 9
      || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+size-1)/tilewidth] == 9
    ){
        cpct_clearScreen(0);
        drawMap(2);
  }
  return bound;
}


/* TECLADO*/

u8* checkKeyboard(u8 *x,u8 *y,u8 *atk,u8 *dir,u8 *s,u8 *size,u8 *finish,u8 *arrow){
  u8 *sprite = s;
  if(cpct_isKeyPressed(Key_Space) && atk[0]>=20){
      size[0] = 5;
      if(atk[0] >= 50) atk[0] =0;
      else atk[0] += 1;
      if(dir[0] == 6) {s = gladis_atk_dcha;}
      else if(dir[0] == 4) {s = gladis_atk_izda;}
  }else{
    if(atk[0] < 20) atk[0] += 1;
    else atk[0] = 20;
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
      }else if(cpct_isKeyPressed(Key_X) && arrow == 0){

        u8 *spr,xs,ys;
        switch(dir[0]){
          case 6: spr = flecha_dcha; xs=2;ys=8; break;
          case 4: spr = flecha_izda; xs=2;ys=8; break;
          case 2: spr = flecha_arriba; xs=4;ys=4; break;
          case 8: spr = flecha_abajo; xs=4;ys=4; break;
        }
        object.x = x[0]+4;
        object.y = y[0]+8;
        object.x = object.x;
        object.y = object.y;
        object.sprite = spr;
        object.vivo = 0;
        object.dir = dir[0];
        object.xsize = xs;
        object.ysize = ys;
        arrow[0]=1;
      }else {
        size[0] = 4;
        s = gladis_quieto_dcha;
      }
  }

  if(cpct_isKeyPressed(Key_Esc)){
       finish[0] = 1;
  }

  return s;
}

/*JUEGO*/

void game(){
  TPlayer p = {0,80,0,80,gladis_quieto_dcha,3,6,4,4,0,0,2};
  time_t dTimePrev = time(NULL);    //Tiempo en segundos de la iteracion anterior
  time_t dTimeNow = dTimePrev;      //Tiempo en segundos de la iteracion actual
  u8 dTimeDiff;                     //Diferencia entre ambos tiempos

  //players[0] =p;
   //u8 i = p.x;

   //u8* memptr;
   u8 finish = 0,i=1,arrow=0;
    //u8* memptr;
   u8 bound =0;


   cpct_clearScreen(0);
   drawMap(i);

   while (1){

    //Esperar el retrazado
    cpct_waitVSYNC();

    //Desdibujar personajes
    erasePlayer(p.lx,p.ly,p.lsize);

    //Dibujar personajes
    drawPlayer(p.x,p.y,p.sprite,p.size);

    //Dibujar vida
    drawVida(p.life);

    //Dibujar fatiga
    if(p.atk < 20) drawFatiga(p.atk,2);
    else if(p.atk > 20) drawFatiga(p.atk,16);
    else drawFatiga(p.atk,0);

    //dTimeDiff = difftime(dTimeNow, dTimePrev);    //Calculo de la diferencia entre tiempos (falla)

    //guardar datos anteriores
    p.lx = p.x;
    p.ly = p.y;
    p.latk = p.atk;
    p.lsize = p.size;

      //Comprobar teclado
      cpct_scanKeyboard_f();
      p.sprite = checkKeyboard(&p.x,&p.y,&p.atk,&p.dir,p.sprite,&p.size,&finish,&arrow);
      checkBoundsCollisions(&p.x,&p.y,p.lx,p.ly,p.size);

    dTimePrev = dTimeNow;                           //El tiempo anterior se actualiza
    dTimeNow = time(NULL);                          //El tiempo actual se actualiza (valga la redundancia)

    /********* LA IDEA **********/
    /****************************
    La idea era bastante simpe, restar el tiempo actual al anterior, ver los segundos
    que han pasado y multiplicar ese tiempo por un factor "velocidad" que represente
    los pixeles o bytes que el personaje puede moverse por segundo. Por alguna razon
    el metodo difftime no funciona. He intentado restarlo a mano (dTimeNow - dTimePrev)
    pero o no funcionaba o lo estaba haciendo mal. difftime esta en la linea 341 comentado.

    difftime devuelve un double, tambien he probado a pasarle el resultado a un double
    pero no parecia funcionar. Intentare preguntar si alguien lo ha conseguido.

    *****************************
    ****************************/

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
