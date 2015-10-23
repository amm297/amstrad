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
#define maps 4
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
  u8 room; //habitacion que ocupa el enemigo
  u8 seenX, seenY;
  u8 pursue;
  u8 lp;
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
const u8 g_palette[4] = { 0,26,6,13 };
u8 scene[height][width];
u8 temp;
u8 map;
u8 path;
u8 finish;
u8 arrow;
u8 following;
u8 bound;
u8 archer;
u8 dead;
TNivel n;
TObject object;
TPlayer player;
TEnemy enemy;
const u8 originsp[maps][2] = {{0,80},{64,176},{0,96},{64,0}};
const u8 originse[maps][6] = {{52,80,16,16,16,128},{12,96,52,96,48,48},{52,80,16,160,16,48},{12,96,52,96,48,144}};
const u8 originsu[maps][4] = {{4,160,8,16},{12,32,73,96},{4,16,8,160},{12,144,73,92}};


const u8 mapa1[height][width] = {{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
                                 {1,7,5,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,1},
                                 {1,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,1},
                                 {1,1,1,1,1,1,1,1,1,7,7,1,1,1,1,7,7,1,1,1},
                                 {1,0,0,0,0,6,6,6,6,6,6,1,3,3,3,3,3,3,3,1},
                                 {0,0,1,1,1,4,4,1,6,6,6,1,3,3,3,3,3,3,3,1},
                                 {1,0,1,4,4,4,4,1,6,6,6,1,3,3,3,3,3,3,3,1},
                                 {1,0,1,4,4,4,4,1,6,6,6,1,3,3,3,3,3,3,3,1},
                                 {1,0,1,4,4,4,4,1,6,6,6,1,3,3,3,3,3,3,3,1},
                                 {1,0,1,4,4,4,4,1,6,6,6,3,3,3,3,3,3,3,3,1},
                                 {1,2,1,4,4,4,4,1,6,6,6,3,3,3,3,3,3,3,3,1},
                                 {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,9,1,1,1}};

const u8 mapa2[height][width] = {{1,1,9,9,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
                                 {1,0,0,0,0,0,1,6,6,6,6,6,6,6,6,6,6,0,0,1},
                                 {1,0,0,2,0,0,1,6,6,6,6,6,6,6,6,6,6,1,0,1},
                                 {1,0,0,0,0,0,1,6,6,6,6,6,6,6,6,6,6,1,0,1},
                                 {1,1,1,1,0,0,1,4,4,1,1,1,1,1,1,0,0,1,0,1},
                                 {1,3,3,3,3,3,1,4,4,4,4,4,4,4,1,0,0,1,0,1},
                                 {1,3,3,3,3,3,1,4,4,4,4,4,4,4,1,0,0,1,5,1},
                                 {1,3,3,3,3,3,1,1,1,1,1,1,0,0,1,0,0,1,1,1},
                                 {1,3,3,3,3,3,3,3,3,3,3,3,3,3,1,0,0,0,0,1},
                                 {1,3,3,3,3,3,3,3,3,3,3,3,3,3,1,0,0,0,0,1},
                                 {1,3,3,3,3,3,3,3,3,3,3,3,3,3,1,0,0,0,0,1},
                                 {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1}};





#endif
