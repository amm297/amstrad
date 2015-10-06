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
#define width 20
#define height 12
#define tilewidth 4
#define tileheight 16
#define playerwidth 4
#define playerheight 16
#define numplayers 2


typedef struct 
{
  u8 x,y; //posicion personaje
  u8 lx,ly; //posicion personaje
  u8 *sprite; //sprite persnaje
  u8 life; //vida personaje
  u8 dir; //direccion personaje
  u8 size; //size ancho personaje
  u8 lsize; //last size ancho anterior personaje
  u8 atk; //Ataque personaje
  u8 latk; //Ataque previo personaje
  u8 bullets; //Municion restante
}TPlayer;

typedef struct 
{
  u8 x,y; //posicion objeto
  u8 lx,ly; //posicion objeto
  u8 *sprite; //sprite objeto
  u8 vivo; //objeto cogido
  u8 dir;
  u8 xsize;
  u8 ysize;
}TObject;

//const u8* sprite = gladis_quieto_dcha;
const u8 g_palette[4] = { 0,26,6,18 };
const u8 *scene[height];
TObject object;
TPlayer players[numplayers];


//Definicion de mapa
  //0 -> Zona libre
  //1 -> Bordes del Mapa
  //2 -> Zona Patrulla
  //5 -> Flecha
  //6 -> Corazon
  //9 -> Puerta

const u8 mapa1[height][width] = {{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
                                  {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                                  {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                                  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1},
                                  {1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1},
                                  {0,0,1,1,0,1,1,1,2,2,2,1,0,0,0,0,0,0,0,1},
                                  {1,0,1,2,2,2,2,1,0,0,0,1,0,0,0,0,0,0,0,1},
                                  {1,0,1,2,2,2,2,1,2,2,2,1,0,0,0,0,0,0,0,1},
                                  {1,0,1,2,2,2,2,1,0,0,0,1,0,0,0,0,0,0,0,1},
                                  {1,0,1,2,2,2,2,1,2,2,2,1,0,0,0,0,0,0,0,1},
                                  {1,5,1,2,2,2,2,1,0,0,0,0,0,0,0,0,0,0,0,1},
                                  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,1,1,1,1}};

const u8 mapa2[height][width] = {{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
                                  {1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,6},
                                  {1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                                  {1,0,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1},
                                  {1,0,5,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1},
                                  {1,0,1,1,0,1,1,1,2,2,2,1,0,0,0,5,0,0,0,1},
                                  {1,0,1,2,2,2,2,1,0,0,0,1,0,0,0,5,0,0,0,1},
                                  {1,0,1,2,2,2,2,1,2,2,2,1,0,0,0,5,0,0,0,1},
                                  {1,0,1,2,2,2,2,1,0,0,0,1,0,0,0,0,0,0,0,1},
                                  {1,0,1,2,2,2,2,1,2,2,2,1,0,0,0,0,0,0,0,1},
                                  {1,5,1,2,2,2,2,1,0,0,0,0,0,0,0,0,0,0,0,1},
                                  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1}};



#endif