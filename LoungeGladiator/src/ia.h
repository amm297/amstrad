///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
//// IA MODULE
////   Controls all the high-level logic that implements the game
////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

#ifndef _IA_H_
#define _IA_H_

u8 detectPlayerRoom(u8 px,u8 py){
  return scene[py/tileheight][px/tilewidth];
}

u8 chooseDirection(){

  u8 dir = 0;
   u8 rnd = (rand()%4)+1;
    switch(rnd){
      case 4: dir = 6;break;
      case 3: dir = 4;break;
      case 2: dir = 2;break;
      case 1: dir = 8;break;
    }

  return dir;
}


u8 setDirection(u8 px,u8 py,u8 x,u8 y){
  u8 dir;
  if(px < x) dir = 4;
  else if(py > y) dir = 2;
  else if(px > x) dir = 6;
  else dir = 8;
  return dir;
}

void movement(u8 dir){
  switch(dir){
      case 6: enemy.x += 1; break;
      case 4: enemy.x -= 1; break;
      case 8: enemy.y -= 2; break;
      case 2: enemy.y += 2; break;
    }
}



/*u8 followPlayer(){
  u8 following = 1;
  enemy.dir = setDirection(player.x,player.y,enemy.x,enemy.y);
  movement(enemy.dir,&enemy.x,&enemy.y);
  if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] == 1
  || scene[(enemy.y)/tileheight][(enemy.x+tilewidth-1)/tilewidth] == 1
  || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x)/tilewidth] == 1
  || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x+tilewidth-1)/tilewidth] == 1
  ){
    enemy.x=enemy.lx;
    enemy.y=enemy.ly;
  }

  return following;

}

void patrol(){
  movement(enemy.dir,&enemy.x,&enemy.y);
  if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] != enemy.room
  || scene[(enemy.y)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
  || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x)/tilewidth] != enemy.room
  || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
  ){
    enemy.x=enemy.lx;
    enemy.y=enemy.ly;
  }
}

u8 vissionSensor(){
  u8 following = 0;
  u8 cx = enemy.x/tilewidth;
  u8 cy = enemy.y/tilewidth;
  u8 pcx = player.x/tilewidth;
  u8 pcy = player.y/tilewidth;
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

}*/

#endif
