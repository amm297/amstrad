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
#include "CalcColision.h"

/*INICIALIZACION*/
void init(){
   cpct_disableFirmware();
   cpct_setVideoMode(0);
   cpct_fw2hw(g_palette,4);
   cpct_setPalette(g_palette,4);
}


void initPlayer(){
  u8 *sprite = gladis_quieto_dcha;
  player.x = 0;
  player.y = 80;
  player.lx = 0;
  player.ly = 80;
  player.sprite = sprite;
  player.life = 3;
  player.dir = 6;
  player.sizeX = 4;
  player.sizeY = 16;
  player.lsize = 4;
  player.atk = 20;
  player.latk = 20;
  player.bullets = 3;
  player.type = 0;
  player.room = 0;
}

void initEnemies(){
  u8 *sprite = chacho_dcha;
    enemies[0].x = 52;
    enemies[0].y = 80;
    enemies[0].lx = 52;
    enemies[0].ly = 80;
    enemies[0].sprite = sprite;
    enemies[0].life = 1;
    enemies[0].dir = 6;
    enemies[0].sizeX = 4;
    enemies[0].sizeY = 16;
    enemies[0].lsize = 4;
    enemies[0].atk = 0;
    enemies[0].latk = 0;
    enemies[0].bullets = 0;
    enemies[0].type = 1;
    enemies[0].room = 3;

    enemies[1].x = 40;
    enemies[1].y = 64;
    enemies[1].lx = 40;
    enemies[1].ly = 64;
    enemies[1].sprite = sprite;
    enemies[1].life = 1;
    enemies[1].dir = 6;
    enemies[1].sizeX = 4;
    enemies[1].sizeY = 16;
    enemies[1].lsize = 4;
    enemies[1].atk = 0;
    enemies[1].latk = 0;
    enemies[1].bullets = 1;
    enemies[1].type = 2;
    enemies[1].room = 0;

    enemies[2].x = 16;
    enemies[2].y = 96;
    enemies[2].lx = 16;
    enemies[2].ly = 96;
    enemies[2].sprite = sprite;
    enemies[2].life = 1;
    enemies[2].dir = 6;
    enemies[2].sizeX = 4;
    enemies[2].sizeY = 16;
    enemies[2].lsize = 4;
    enemies[2].atk = 0;
    enemies[2].latk = 0;
    enemies[2].bullets = 0;
    enemies[2].type = 1;
    enemies[2].room = 3;

  
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


/*MAPA*/
void drawMap(u8 t){
   int posX=0,posY =0,x=0,y=0;
   u8* memptr;

   if(t == 1){
    for(y=0;y<height;y++){
      for(x=0;x<width;x++){
        scene[y][x] = mapa1[y][x];
      }
    }
  }

  if(t == 2){
    for(y=0;y<height;y++){
      for(x=0;x<width;x++){
        scene[y][x] = mapa2[y][x];
      }
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

void drawPlayer(u8 x,u8 y,u8 *sprite,u8 sizeX,u8 sizeY,u8 life){
  u8* memptr;
  if(life > 0){
    memptr = cpct_getScreenPtr(VMEM,x,y);
    cpct_drawSpriteMasked(sprite, memptr, sizeX, sizeY);
  }
}

void erasePlayer(u8 x,u8 y,u8 sizeX,u8 sizeY){
  u8* memptr;
  //if(p.life > 0){
    memptr = cpct_getScreenPtr(VMEM,x,y);
    cpct_drawSolidBox(memptr,0,sizeX,sizeY);
  //}
}



void erasePlayers(){
  u8 i=0;
  erasePlayer(player.lx,player.ly,player.lsize,player.sizeY);
    for(i=0;i<numenemies;i++){
      if(enemies[i].life > 0)
        erasePlayer(enemies[i].lx,enemies[i].ly,enemies[i].lsize,enemies[i].sizeY);
    }
}

void drawPlayers(){
  u8 i=0;
  drawPlayer(player.x,player.y,player.sprite,player.sizeX,player.sizeY,player.life);
    for(i=0;i<numenemies;i++){
      if(enemies[i].life > 0)
        drawPlayer(enemies[i].x,enemies[i].y,enemies[i].sprite,enemies[i].sizeX,enemies[i].sizeY,enemies[i].life);
    }
}

/*FATIGA*/

void drawFatiga(u8 atk, u8 col){
  u8* memptr;
    if(atk < 20)
        col = 2;
    if(atk > 30 || atk <= 20){
        memptr = cpct_getScreenPtr(VMEM,4,192);
        switch(col){
        case 0:
            cpct_drawSolidBox(memptr, col, 2, 8);
            break;
        case 1:
            cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
            break;
        case 2:
            cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
        }
    }
    if(atk > 40 || atk <= 20){
        memptr = cpct_getScreenPtr(VMEM,7,192);
        switch(col){
        case 0:
            cpct_drawSolidBox(memptr, col, 2, 8);
            break;
        case 1:
            cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
            break;
        case 2:
            cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
        }
    }
    if(atk <= 20){
        memptr = cpct_getScreenPtr(VMEM,10,192);
        switch(col){
        case 0:
            cpct_drawSolidBox(memptr, col, 2, 8);
            break;
        case 2:
            cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
        }
    }
}

/*PICK-UPS*/
void drawPickUps(u8 corazon, u8 bullet){
    u8* memptr;

    memptr = cpct_getScreenPtr(VMEM, 1*tilewidth, 10*tileheight);
    if(corazon == 0)
        cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
    else
        cpct_drawSolidBox(memptr, 0, 4, 8);

    memptr = cpct_getScreenPtr(VMEM, 2*tilewidth, 1*tileheight);
    if(bullet == 0)
        cpct_drawSpriteMasked(flecha_arriba,memptr,2,8);
    else
        cpct_drawSolidBox(memptr, 0, 2, 8);

}

/*VIDA*/
void drawVida(u8 life){

  u8* memptr;
     int p = 65;
     u8 i =1;
     for(i=1;i<=3;i++){
      memptr = cpct_getScreenPtr(VMEM,p,192);
      p+=5;
      if(i<=life)  cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
      else {
        cpct_drawSolidBox(memptr,0,4,8);
        cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
      }
     }

}
/*PROYECTILES*/
void drawBullets(u8 bullet){
     u8* memptr;
     int p = 50;
     u8 i =1;
     for(i=1;i<=3;i++){
      memptr = cpct_getScreenPtr(VMEM,p,192);
      p+=5;
      if(i<=bullet) cpct_drawSpriteMasked(flecha_arriba, memptr, 2, 8);
      else  cpct_drawSolidBox(memptr,0,2,8);
     }

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
void checkArrowCollisions(u8 *arrow){

  u8 posX = object.x;
  u8 posY = object.y;
   if(    scene[(posY)/tileheight][(posX)/tilewidth] == 1
      || scene[(posY)/tileheight][(posX+object.sizeX-1)/tilewidth] == 1
      || scene[(posY+object.sizeY-2)/tileheight][(posX)/tilewidth] == 1
      || scene[(posY+object.sizeY-2)/tileheight][(posX+object.sizeX-1)/tilewidth] == 1
    ){
      arrow[0] = 0;
   }
}

u8 checkBoundsCollisions(u8 *x,u8 *y, u8 lx, u8 ly,u8 sizeX,u8 sizeY,u8 *life,u8 *bullets,u8 *corazon, u8 *flecha){

  u8 *posX = x;
  u8 *posY = y;
  u8 bound = 0;
  if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1
      || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
      || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 1
      || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
    ){
        *posX=lx;
        *posY=ly;
        bound = 1;
  }
   else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 2
      || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 2
      || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 2
      || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 2
    ){
      if(*life < 3 && *corazon == 0){
        *life += 1;
        *corazon = 1;
      }
  }
  else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 5
      || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 5
      || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 5
      || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 5
    ){
      if(*bullets < 3 && *flecha == 0){
        *bullets += 1;
        *flecha = 1;
      }
  }else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 9
      || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 9
      || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 9
      || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 9
    ){
        cpct_clearScreen(0);
        drawMap(2);
  }
  return bound;
}

/* TECLADO*/

u8* checkKeyboard(u8 *x,u8 *y,u8 *atk,u8 *dir,u8 *s,u8 *size,u8 *bullets,u8 *finish,u8 *arrow){
  u8 *sprite = s;
  if(cpct_isKeyPressed(Key_Space) && atk[0]>=20){
      size[0] = 5;
      if(atk[0] >= 50) atk[0] =0;
      else atk[0] += 1;
      switch(dir[0]){
        case 4:
            s = gladis_atk_izda;
            break;
        case 6:
            s = gladis_atk_dcha;
            break;
        case 8:
            s = gladis_atk_arriba;
            size[0] = 4;
            break;
        case 2:
            s = gladis_atk_abajo;
            size[0] = 4;
            break;
        }
  }else{
    if(atk[0] < 20) atk[0] += 1;
    else atk[0] = 20;
    if(cpct_isKeyPressed(Key_CursorRight) && x[0] < 76){
         x[0] += 1;
         dir[0] = 6;
         size[0] = 4;
         s = gladis_quieto_dcha;
      }else if(cpct_isKeyPressed(Key_CursorLeft) && x[0] > 0){
         x[0] -= 1;
         dir[0] = 4;
         size[0] = 4;
         s = gladis_quieto_izda;
      }else  if(cpct_isKeyPressed(Key_CursorDown) && y[0] < 180){
         y[0] += 2;
         dir[0] = 2;
         size[0] = 4;
         s = gladis_abajo;
      }else if(cpct_isKeyPressed(Key_CursorUp) && y[0] > 0 ){
         y[0] -= 2;
         dir[0] = 8;
         size[0] = 4;
         s = gladis_arriba;
      }else if(cpct_isKeyPressed(Key_X) && arrow[0] == 0){
      if(bullets[0] > 0){

        u8 *spr = flecha_dcha,xs=2,ys=8,ox=x[0]+4;
        switch(dir[0]){
          case 6: spr = flecha_dcha; xs=4;ys=4;ox=x[0]+4; break;
          case 4: spr = flecha_izda; xs=4;ys=4;ox=x[0]-4; break;
          case 2: spr = flecha_abajo; xs=2;ys=8; break;
          case 8: spr = flecha_arriba; xs=2;ys=8; break;
        }
        object.x = ox;
        object.y = y[0]+8;
        object.x = object.x;
        object.y = object.y;
        object.sprite = spr;
        object.vivo = 1;
        object.dir = dir[0];
        object.sizeX = xs;
        object.sizeY = ys;
        bullets[0]--;
      }
        arrow[0]=1;
      }else {
        switch(dir[0]){
        case 4:
            s = gladis_quieto_izda;
            break;
        case 6:
            s = gladis_quieto_dcha;
            break;
        case 8:
            s = gladis_arriba;
            break;
        case 2:
            s = gladis_abajo;
            break;
        }
        size[0] = 4;
      }
  }


  if(cpct_isKeyPressed(Key_L)){
       arrow[0] = 0;
  }
  if(cpct_isKeyPressed(Key_Esc)){
       finish[0] = 1;
  }

  return s;
}

void moveObject(){
  object.lx = object.x;
  object.ly = object.y;
  switch(object.dir){
    case 6: object.x += 1; break;
    case 4: object.x -= 1; break;
    case 2: object.y += 2; break;
    case 8: object.y -= 2; break;
  }
}



u8* move(){
  u8* sprite = chacho_dcha;


  return sprite;
}

/*JUEGO*/

void game(){
  TNivel n = {0,0,0};
  u8 finish = 0,arrow=0,following = 0, bound =0,i=0;
  
  temp = 0;
  map = 1;

  initPlayer();
  initEnemies();
   cpct_clearScreen(0);
   drawMap(map);



   while (1){

    //Esplayererar el retrazado
    cpct_waitVSYNC();

    //Desdibujar playerersonajes
    erasePlayers();
    
    if(arrow == 1){
      erasePlayer(object.lx,object.ly,object.sizeX,object.sizeY);
      if(bound == 1) arrow = 0;
    }

    //Dibujar playerickuplayers
    drawPickUps(n.corazon,n.bullet);

    //Dibujar playerersonajes
    drawPlayers();
    if(arrow == 1) drawPlayer(object.x,object.y,object.sprite,object.sizeX,object.sizeY,object.vivo);

    //Dibujar vida
    drawVida(player.life);
    drawBullets(player.bullets);

    //Dibujar fatiga
    if(player.atk < 20) drawFatiga(player.atk,2);
    else if(player.atk > 20) drawFatiga(player.atk,1);
    else drawFatiga(player.atk,0);

    //guardar datos anteriores
    player.lx = player.x;
    player.ly = player.y;
    player.latk = player.atk;
    player.lsize = player.sizeX;

      //Complayerrobar teclado
      cpct_scanKeyboard_f();
      player.sprite = checkKeyboard(&player.x,&player.y,&player.atk,&player.dir,player.sprite,&player.sizeX,&player.bullets,&finish,&arrow);
      checkBoundsCollisions(&player.x,&player.y,player.lx,player.ly,player.sizeX,player.sizeY,&player.life,&player.bullets,&n.corazon,&n.bullet);
      
      if(arrow == 1){
        moveObject();
        bound = checkBoundsCollisions(&object.x,&object.y,object.lx,object.ly,object.sizeX,object.sizeY,0,0,0,0);
      
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
