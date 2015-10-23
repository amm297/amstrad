///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
//// MAPA MODULE
////   Controls all the high-level logic that implements the game
////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

#ifndef _INIT_H_
#define _INIT_H_

/*INICIALIZACION*/
void init(){
   cpct_disableFirmware();
   cpct_setVideoMode(0);
   cpct_fw2hw(g_palette,4);
   cpct_setPalette(g_palette,4);
}

void initPlayer(u8 p){
  u8 *sprite = gladis_quieto_dcha;
  player.x = origins[p-1][0];
  player.y = origins[p-1][1];
  player.lx = origins[p-1][0];
  player.ly = origins[p-1][1];
  player.sprite = sprite;
  player.life = 3;
  player.dir = 6;
  player.atk = 20;
  player.latk = 20;
  player.bullets = 3;
}

void initEnemies(u8 p){
  u8 *sprite = chacho_dcha;
    enemy.x = origins[p-1][2];
    enemy.y = origins[p-1][3];
    enemy.lx = origins[p-1][2];
    enemy.ly = origins[p-1][3];
    enemy.ox = origins[p-1][2];
    enemy.oy = origins[p-1][3];
    enemy.sprite = sprite;
    enemy.life = 3;
    enemy.dir = 6;
    enemy.bullets = 3;
    enemy.room = 3;

}

void initNivel(){
  n.num=0;
  n.corazon=0;
  n.bullet=0;
}

void initVariables(u8 m){
   bound =0;
  temp = 0;
  map = m;
  arrow =0;
  finish =0;
  following =0;
  archer = 0;
  dead =0;
}

#endif