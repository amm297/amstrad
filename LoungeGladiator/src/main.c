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
#include "ia.h"
#include "CalcColision.h"

/*INICIALIZACION*/
void init(){
   cpct_disableFirmware();
   cpct_setVideoMode(0);
   cpct_fw2hw(g_palette,4);
   cpct_setPalette(g_palette,4);
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
            cpct_drawSprite(muro,memptr, tilewidth, tileheight);
         }
         if(scene[posY][posX] == 9){
            cpct_drawSolidBox(memptr, 9, tilewidth, tileheight);
         }/*
         if(scene[posY][posX] == 5){
            cpct_drawSpriteMasked(flecha_arriba, memptr, 2, 8);
         }
         if(scene[posY][posX] == 2){
            cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
         }*/
      }
   }
}

/*PERSONAJES*/

void drawPlayer(u8 x,u8 y,u8 *sprite,u8 life,u8 mode){
    u8* memptr;
    if(life > 0){
        memptr = cpct_getScreenPtr(VMEM,x,y);
        switch(mode){
        case 0:
            cpct_drawSpriteMasked(sprite, memptr, 4, 16);
            break;
        case 1:
            cpct_drawSpriteMasked(sprite, memptr, 2, 8);
            break;
        case 2:
            cpct_drawSpriteMasked(sprite, memptr, 4, 4);
            break;
        }
    }
}

void erasePlayer(u8 x,u8 y,u8 mode){
    u8* memptr;

    memptr = cpct_getScreenPtr(VMEM,x,y);
    switch(mode){
    case 0:
        cpct_drawSolidBox(memptr,0,4,16);
        break;
    case 1:
        cpct_drawSolidBox(memptr,0,2,8);
        break;
    case 2:
        cpct_drawSolidBox(memptr,0,4,4);
        break;
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
 /* u8* memptr;
    /*if(life >= 1){
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
        cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);*/

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
    /*if(bullet == 1){
        memptr = cpct_getScreenPtr(VMEM,50,192);
        cpct_drawSpriteMasked(flecha_arriba, memptr, 2, 8);
    }
    memptr = cpct_getScreenPtr(VMEM,55,192);
    if(bullet == 2)
        cpct_drawSpriteMasked(flecha_arriba, memptr, 2, 8);
    else

    memptr = cpct_getScreenPtr(VMEM,60,192);
    if(bullet >= 3)
        cpct_drawSolidBox(memptr,0,2,8);
    else
        cpct_drawSpriteMasked(flecha_arriba, memptr, 2, 8);*/

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
      }else if(cpct_isKeyPressed(Key_X) && arrow[0] == 0 && atk[0] == 20){
      if(bullets[0] > 0){
        u8 *spr = flecha_dcha,xs=2,ys=8,ox=x[0]+4;
        switch(dir[0]){
          case 6: spr = flecha_dcha; xs=4;ys=4;ox=x[0]; break;
          case 4: spr = flecha_izda; xs=4;ys=4;ox=x[0]; break;
          case 2: spr = flecha_abajo; xs=2;ys=8;ox=x[0]; break;
          case 8: spr = flecha_arriba; xs=2;ys=8;ox=x[0]; break;
        }
        atk[0] = 0;
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




void followPlayer(u8 px,u8 py,u8 *x,u8 *y,u8 seenX,u8 seenY,u8 room){
    u8 auxX, auxY;

    if(detectPlayerRoom(px,py) != room){
        auxX = seenX;
        auxY = seenY;
    }else{
        auxX = px;
        auxY = py;
    }
    /*u8 *memptr;
    memptr = cpct_getScreenPtr(VMEM,5,50);*/
    if(auxX < *x){
        //cpct_drawSolidBox(memptr, 1, 2, 8);
        if(scene[(y[0])/tileheight][(x[0]-1)/tilewidth] != 1){
            *x-=1;
        }else if(auxY < *y){
            if(scene[(y[0]-1)/tileheight][(x[0])/tilewidth] != 1)
                *y-=1;
        }else{
            if(scene[(y[0]+tileheight)/tileheight][(x[0])/tilewidth] != 1)
                *y+=1;
        }
    }else if(auxX > *x){
        //cpct_drawSolidBox(memptr, 10, 2, 8);
        if(scene[(y[0])/tileheight][(x[0]+tilewidth)/tilewidth] != 1){
            *x+=1;
        }else if(auxY < *y){
            if(scene[(y[0])/tileheight][(x[0]-1)/tilewidth] != 1)
                *y-=1;
        }else{
            if(scene[(y[0]+tileheight)/tileheight][(x[0])/tilewidth] != 1)
            *y+=1;
        }
    }else{
        //
        if(auxY < *y){
            if(scene[(y[0]-1)/tileheight][(x[0])/tilewidth] != 1)
                *y-=1;
            }else{
                if(scene[(y[0]+tileheight)/tileheight][(x[0])/tilewidth] != 1)
                *y+=1;
            }
    }
}

/*
if(scene[(y[0])/tileheight][(x[0])/tilewidth] == 1
  || scene[(y[0])/tileheight][(x[0]+sizeX-1)/tilewidth] == 1
  || scene[(y[0]+sizeY-2)/tileheight][(x[0])/tilewidth] == 1
  || scene[(y[0]+sizeY-2)/tileheight][(x[0]+sizeX-1)/tilewidth] == 1
  ){
    *x=lx;
    *y=ly;
  }
*/

void patrol(u8 dir,u8 lx,u8 ly,u8 *x,u8 *y,u8 room){
  //scene[(y[0])/tileheight][(x[0])/tilewidth] = room;

  movement(dir,&x[0],&y[0]);

  if(scene[(y[0])/tileheight][(x[0])/tilewidth] != room
  || scene[(y[0])/tileheight][(x[0]+tilewidth-1)/tilewidth] != room
  || scene[(y[0]+tileheight-2)/tileheight][(x[0])/tilewidth] != room
  || scene[(y[0]+tileheight-2)/tileheight][(x[0]+tilewidth-1)/tilewidth] != room
  ){
    switch(dir){
    case 4:
        movement(6,&x[0],&y[0]);
        break;
    case 6:
        movement(4,&x[0],&y[0]);
        break;
    case 2:
        movement(8,&x[0],&y[0]);
        break;
    case 8:
    movement(2,&x[0],&y[0]);
        break;
    }
  }
  //scene[(y[0])/tileheight][(x[0])/tilewidth] = 2;
}

u8 vissionSensor(u8 x,u8 y,u8 px,u8 py){
  u8 following = 0;
  u8 cx = x/tilewidth;
  u8 cy = y/tilewidth;
  u8 pcx = px/tilewidth;
  u8 pcy = py/tilewidth;
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


void move(u8 *x,u8 *y,u8 lx, u8 ly,u8 *dir,u8 *s,u8 *room,u8 px,u8 py,u8 *seenX,u8 *seenY,u8 *following,u8 *pursue){
    if(temp > 4){
        dir[0] = chooseDirection();
        following[0] = detectPlayerRoom(px,py);
        if(following[0] == room[0] || *pursue != 0){
            if(pursue == 0)
                *pursue = 1;
            else
                *pursue -=1;
        }
        temp = 0;
    }else{
        if(temp%2 == 0)
        if(*pursue >= 1){
            followPlayer(px,py,x,y,*seenX,*seenY,room[0]);
            if(*seenX == *x && *seenY == *y)
                *pursue = 0;
        }else{
            patrol(dir[0],lx,ly,&x[0],&y[0],room[0]);
        }
    }
    if((detectPlayerRoom(lx,ly) != detectPlayerRoom(px,py)) && pursue != 0){
        *seenX = px;
        *seenY = py;
    }
    *room = detectPlayerRoom(x[0],y[0]);
    temp += 1;
}

/*
if(detected == 0){
          if(following[0] == 1){
            followPlayer(px,py,&x[0],&y[0],lx,ly,&dir[0],room,sizeX,sizeY);
            following[0] = vissionSensor(x[0],y[0],px,py);
          }else{
            if(scene[(y[0])/tileheight][(x[0]+sizeX-1)/tilewidth] != 0
            || scene[(y[0]+sizeY-2)/tileheight][(x[0])/tilewidth] != 0
            || scene[(y[0]+sizeY-2)/tileheight][(x[0]+sizeX-1)/tilewidth] != 0){
              patrol(dir[0],lx,ly,&x[0],&y[0],room,sizeX,sizeY);
*/

/*JUEGO*/

void game(){
  TPlayer p = {0,80,0,80,gladis_quieto_dcha,3,6,4,16,4,20,20,3};
  TEnemy e = {52,80,52,80,52,80,chacho_dcha,3,2,3,3,0,0,0};
  TNivel n = {0,0,0};

  //players[0] =p;
   //u8 i = p.x;

   //u8* memptr;
   u8 finish = 0,i=1,arrow=0,following = 0;
    //u8* memptr;
   u8 bound = 0;
   temp = 0;

   cpct_clearScreen(0);
   drawMap(i);



   while (1){

    //Esperar el retrazado
    cpct_waitVSYNC();

    //Desdibujar personajes
    erasePlayer(p.lx,p.ly,0);
    erasePlayer(e.lx,e.ly,0);
    if(arrow == 1){
        if(object.dir == 4 || object.dir == 6)
            erasePlayer(object.lx,object.ly,2);
        else
            erasePlayer(object.lx,object.ly,1);
        if(bound == 1) arrow = 0;
    }

    //Dibujar pickups
    drawPickUps(n.corazon,n.bullet);

    //Dibujar personajes
    drawPlayer(p.x,p.y,p.sprite,p.life,0);
    if(e.life > 0) drawPlayer(e.x,e.y,e.sprite,e.life,0);

    if(arrow == 1){
        if(object.dir == 4 || object.dir == 6)
            drawPlayer(object.x,object.y,object.sprite,object.vivo,2);
        else if(object.dir == 2 || object.dir == 8)
            drawPlayer(object.x,object.y,object.sprite,object.vivo,1);
    }


    //Dibujar vida
    drawVida(p.life);
    drawBullets(p.bullets);

    //Dibujar fatiga
    if(p.atk < 20) drawFatiga(p.atk,2);
    else if(p.atk > 20) drawFatiga(p.atk,1);
    else drawFatiga(p.atk,0);

    //guardar datos anteriores
    p.lx = p.x;
    p.ly = p.y;
    e.lx = e.x;
    e.ly = e.y;
    p.latk = p.atk;
    p.lsize = p.sizeX;

      //Comprobar teclado
      cpct_scanKeyboard_f();
      p.sprite = checkKeyboard(&p.x,&p.y,&p.atk,&p.dir,p.sprite,&p.sizeX,&p.bullets,&finish,&arrow);
      checkBoundsCollisions(&p.x,&p.y,p.lx,p.ly,p.sizeX,p.sizeY,&p.life,&p.bullets,&n.corazon,&n.bullet);
      if(e.life > 0)
        move(&e.x,&e.y,p.lx,p.ly,&e.dir,e.sprite,&e.room,p.x,p.y,&e.seenX,&e.seenY,&following,&e.pursue);

      if(e.life > 0)
          if(checkCollisions(p.x, p.y, e.x, e.y, p.atk) == 2){
            p.x = 0;
            p.y = 80;
            p.life -= 1;
            if(p.life == 0){
                gameOver();
                break;
            }
          }else if(checkCollisions(p.x, p.y, e.x, e.y, p.atk) == 1){
            e.life =0;
          }
        //falta la funcion para matar al enemigo

      if(arrow == 1){
        moveObject();
        bound = checkBoundsCollisions(&object.x,&object.y,object.lx,object.ly,object.sizeX,object.sizeY,0,0,0,0);
        if(checkCollisions(object.x, object.y, e.x, e.y, 21) == 1){
            e.life = 0;
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
