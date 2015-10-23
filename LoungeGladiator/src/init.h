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
  player.x = originsp[p-1][0];
  player.y = originsp[p-1][1];
  player.lx = originsp[p-1][0];
  player.ly = originsp[p-1][1];
  player.sprite = sprite;
  player.life = 3;
  player.dir = 6;
  player.atk = 20;
  player.latk = 20;
  player.bullets = 3;
}

void restartPlayer(u8 p){
  u8 *sprite = gladis_quieto_dcha;
  player.x = originsp[p-1][0];
  player.y = originsp[p-1][1];
  player.lx = originsp[p-1][0];
  player.ly = originsp[p-1][1];
  player.sprite = sprite;
  player.dir = 6;
  player.atk = 20;
  player.latk = 20;
}

void initEnemies(u8 p){
  u8 *sprite = chacho_dcha;
    enemy.x = originse[p-1][0];
    enemy.y = originse[p-1][1];
    enemy.lx = originse[p-1][0];
    enemy.ly = originse[p-1][1];
    enemy.ox = originse[p-1][2];
    enemy.oy = originse[p-1][3];
    enemy.sprite = sprite;
    enemy.life = 1;//p;
    enemy.dir = 6;
    enemy.room = 3;
    enemy.lp = 75 - ((p-1)*5);
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