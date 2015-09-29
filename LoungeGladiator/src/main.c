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
#include "single.h"


#define VMEM (u8*)0xC000

typedef struct 
{
  u8 x,y; //posicion personaje

}TPlayer;

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

/*JUEGO*/

void game(){
   TPlayer p = { 0,100 };
   u8* memptr;
   u8* sprite = g_tile_single_0;
   cpct_clearScreen(0);

   while (1){
     
      //Esperar el retrazado
      cpct_waitVSYNC();

      //Desdibujar personaje   
      memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
      cpct_drawSolidBox(memptr,0,11,49);


      //Comprobar teclado
      cpct_scanKeyboard_f();
      if(cpct_isKeyPressed(Key_CursorRight) && p.x < 69 ){
         p.x += 1;
         sprite = g_tile_single_0;
      }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
         p.x -= 1;
         sprite = g_tile_single_1;
      }else  if(cpct_isKeyPressed(Key_Esc)){
         return;
      }
      //Dibujar personaje   
      memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
      cpct_drawSpriteMasked(sprite,memptr,11,49);
   }
}



/*MAPA*/

void loadMap(){
  
}


/*EMPIEZA EL CODIGO*/

void main(void) {

   init();
    FILE *fr;
   //loadMap();
   // Loop forever
   while(1){
      menu();
      game();
   }
      
}
