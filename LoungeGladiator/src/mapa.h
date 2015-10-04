///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
//// MAPA MODULE
////   Controls all the high-level logic that implements the game
////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

#ifndef _MAPA_H_
#define _MAPA_H_


#define VMEM (u8*)0xC000
#define width 16
#define height 10
#define tilewidth 5
#define tileheight 20
#define playerwidth 4
#define playerheight 16

//const u8* sprite = gladis_quieto_dcha;
const u8 g_palette[4] = { 0,26,6,18 };
const int *scene[height];



const int mapa1[height][width] = {{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
                                  {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                                  {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                                  {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                                  {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                                  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                                  {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                                  {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                                  {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                                  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}};

const int mapa2[height][width] = {{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
                                  {1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1},
                                  {1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1},
                                  {1,0,1,0,0,0,0,1,1,1,0,0,0,1,0,1},
                                  {1,0,1,0,0,0,0,1,1,1,0,0,0,1,0,1},
                                  {0,0,1,0,0,0,0,1,0,1,0,0,0,1,0,1},
                                  {1,0,1,1,1,1,1,0,0,0,1,1,1,1,0,1},
                                  {1,0,1,1,1,1,1,0,0,0,1,1,1,1,0,1},
                                  {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                                  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}};

typedef struct 
{
  u8 x,y; //posicion personaje
  u8 *sprite; //sprite persnaje
  u8 life; //vida personaje
  u8 dir; //direccion personaje
  u8 size; //size ancho personaje

}TPlayer;

typedef struct
{
  u8 x,y; //posicion enemigo
  u8 vivo; //control vida enemigo
  u8 *sprite; //sprite
}TEnemy;

#endif