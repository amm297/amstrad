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
#define numenemies 1


typedef struct
{
  u8 x,y; //posicion personaje
  u8 lx,ly; //posicion personaje
  u8 *sprite; //sprite persnaje
  u8 life; //vida personaje
  u8 dir; //direccion personaje
  u8 atk; //Ataque personaje
  u8 latk; //Ataque previo personaje
  u8 bullets; //Municion restante
}TPlayer;

typedef struct 
{
  u8 x,y; //posicion personaje
  u8 lx,ly; //posicion personaje
  u8 ox,oy;
  u8 *sprite; //sprite persnaje
  u8 life; //vida personaje
  u8 dir; //direccion personaje
  u8 bullets; //Municion restante
  u8 room; //habitacion que ocupa el enemigo
}TEnemy;

typedef struct
{
  u8 x,y; //posicion objeto
  u8 lx,ly; //posicion objeto
  u8 *sprite; //sprite objeto
  u8 vivo; //objeto cogido
  u8 dir;
  u8 sizeX;
  u8 sizeY;
}TObject;

typedef struct{
  u8 num;
  u8 corazon;
  u8 bullet;
}TNivel;

//const u8* sprite = gladis_quieto_dcha;
const u8 g_palette[5] = { 0,26,6,13 };
u8 scene[height][width];
int temp;
u8 map;
u8 path;
u8 finish;
u8 arrow;
u8 following;
u8 bound;
u8 archer;
TObject object;
TPlayer player;
TEnemy enemy;


//Definicion de mapa
  //0 -> Zona libre
  //1 -> Bordes del Mapa
  //2 -> -posicion enemigo
    //3 -> habitacion
    //4 -> habitacion
  //5 -> Flecha
  //6 -> Corazon
  //9 -> Puerta
  //10 -> puertas a zonas
const u8 origins[2][2] = {{0,80},{52,80}};

const u8 mapa1[height][width] = {{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
                                 {1,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                                 {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                                 {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1},
                                 {1,0,0,0,0,0,0,0,0,0,0,1,3,3,3,3,3,3,3,1},
                                 {0,0,1,1,0,1,1,1,0,0,0,1,3,3,3,3,3,3,3,1},
                                 {1,0,1,0,0,0,0,1,0,0,0,1,3,3,3,3,3,3,3,1},
                                 {1,0,1,0,0,0,0,1,0,0,0,1,3,3,3,3,3,3,3,1},
                                 {1,0,1,0,0,0,0,1,0,0,0,1,3,3,3,3,3,3,3,1},
                                 {1,0,1,0,0,0,0,1,0,0,0,1,3,3,3,3,3,3,3,1},
                                 {1,2,1,0,0,0,0,1,0,0,0,10,3,3,3,3,3,3,3,1},
                                 {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,9,1,1,1}};

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
