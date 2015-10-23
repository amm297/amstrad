///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
//// IA MODULE
////   Controls all the high-level logic that implements the game
////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

#ifndef _IA_H_
#define _IA_H_

u8 detectPlayerRoom(u8 px,u8 py,u8 room){
  u8 detected = 0; // no detectado
  if (scene[py/tileheight][px/tilewidth] == room) detected = 1;
  return detected;
}

u8 chooseDirection(u8 d){
 
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

void movement(u8 dir,u8 *x,u8 *y){
  switch(dir){
      case 6: x[0] += 1; break;
      case 4: x[0] -= 1; break; 
      case 8: y[0] -= 2; break;
      case 2: y[0] += 2; break;
    }
}


#endif