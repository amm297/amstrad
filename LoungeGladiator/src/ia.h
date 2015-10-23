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

void movement(u8 dir){
  switch(dir){
      case 6: enemy.x += 1; break;
      case 4: enemy.x -= 1; break;
      case 8: enemy.y -= 2; break;
      case 2: enemy.y += 2; break;
    }
}

void followPlayer(){
    u8 auxX, auxY;

    if(detectPlayerRoom(player.x,player.y) != enemy.room){
        auxX = enemy.seenX;
        auxY = enemy.seenY;
    }else{
        auxX = player.x;
        auxY = player.y;
    }
    /*u8 *memptr;
    memptr = cpct_getScreenPtr(VMEM,5,50);*/
    if(auxX < enemy.x){
        //cpct_drawSolidBox(memptr, 1, 2, 8);
        if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1
           && scene[(enemy.y+tileheight)/tileheight][(enemy.x-1)/tilewidth] != 1){
            enemy.x-=1;
        }else if(auxY < enemy.y){
            if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
                enemy.y-=1;
        }else{
            if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
                enemy.y+=1;
        }
    }else if(auxX > enemy.x){
        //cpct_drawSolidBox(memptr, 10, 2, 8);
        if(scene[(enemy.y)/tileheight][(enemy.x+tilewidth)/tilewidth] != 1
           && scene[(enemy.y+tileheight)/tileheight][(enemy.x+tilewidth)/tilewidth] != 1){
            enemy.x+=1;
        }else if(auxY < enemy.y){
            if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1)
                enemy.y-=1;
        }else{
            if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
            enemy.y+=1;
        }
    }else{
        //
        if(auxY < enemy.y){
            if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
                enemy.y-=1;
            }else{
                if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
                enemy.y+=1;
            }
    }
}

void patrol(){
  //scene[(y[0])/tileheight][(x[0])/tilewidth] = room;

  movement(enemy.dir);

  if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] != enemy.room
  || scene[(enemy.y)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
  || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x)/tilewidth] != enemy.room
  || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
  ){
    switch(enemy.dir){
    case 4:
        movement(6);
        break;
    case 6:
        movement(4);
        break;
    case 2:
        movement(8);
        break;
    case 8:
        movement(2);
        break;
    }
  }
  //scene[(y[0])/tileheight][(x[0])/tilewidth] = 2;
}

void move(){
    //u8* memptr;
    if(temp > 10){
        following = detectPlayerRoom(player.x,player.y);
        /*memptr = cpct_getScreenPtr(VMEM,20,20);
        cpct_drawSolidBox(memptr, following, 2, 8);
        memptr = cpct_getScreenPtr(VMEM,24,20);
        cpct_drawSolidBox(memptr, enemy.room, 2, 8);*/
        if(following == enemy.room || enemy.pursue != 0){
            if(enemy.pursue == 0)
                enemy.pursue = 4;
            else if(enemy.pursue > 1)
                enemy.pursue -=1;
        }else{
            enemy.dir = chooseDirection();
        }
    }else{
        if(enemy.pursue >= 1){
            followPlayer();
            if(enemy.seenX == enemy.x && enemy.seenY == enemy.y)
                enemy.pursue = 0;
        }else{
            patrol();
        }
    }
    if((detectPlayerRoom(enemy.lx,enemy.ly) == detectPlayerRoom(player.x,player.y)) || enemy.pursue > 1){
        enemy.seenX = player.x;
        enemy.seenY = player.y;
    }
}


#endif
