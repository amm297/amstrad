#ifndef CALCCOLISION_H
#define CALCCOLISION_H




u8 checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8 atk){
    u8 auxX;
    u8 auxY;
    u8 popX;
    u8 popY;
    u8 eopX;
    u8 eopY;
    switch(atk){
    case 21:
        auxX = 2;
        auxY = 8;
        break;
    case 22:
        auxX = 4;
        auxY = 4;
        break;
    default:
        auxX = tilewidth;
        auxY = tileheight;
    }
    popX = pX + auxX;
    popY = pY + auxY;
    eopX = eX + auxX;
    eopY = eY + auxY;

    if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
        if(atk >= 21)
            return 1;
        else
            return 2;

    if(eX >= pX && eX <= popX && eY >= pY && eY <= popY)
        if(atk >= 21)
            return 1;
        else
            return 2;

    if(eX >= pX && eX <= popX && eopY >= pY && eopY <= popY)
        if(atk >= 21)
            return 1;
        else
            return 2;

    if(eopX >= pX && eopX <= popX && eopY >= pY && eopY <= popY)
        if(atk >= 21)
            return 1;
        else
            return 2;

    return 0;
}


void checkBoundsCollisions(u8 *corazon,u8 *flecha){
 if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 1
      || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
      || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 1
      || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
    ){
        player.x=player.lx;
        player.y=player.ly;
  }
   else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 2
      || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
      || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 2
      || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
    ){
      if(player.life < 3 && *corazon == 0){
        player.life += 1;
        *corazon = 1;
      }
  }
  else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 5
      || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
      || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 5
      || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
    ){
      if(player.bullets < 3 && *flecha == 0){
        player.bullets += 1;
        *flecha = 1;
      }
  }else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 9
      || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
      || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 9
      || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9

    ){
      if(enemy.life == 0){
          map+=1;
          if(map > maps){
            endGame();
            finish = 1;
            return;
          }

          initVariables(map);
          restartPlayer(map);
          initNivel();
          initEnemies(map);

          cpct_clearScreen(0);
          
          drawMap(map);
        }else {
          player.x=player.lx;
          player.y=player.ly;
        }
        
  }
}

u8 checkArrowCollisions(){

    u8 bound =0;
        if(    scene[(object.y)/tileheight][(object.x)/tilewidth] == 1
      || scene[(object.y)/tileheight][(object.x+tilewidth-1)/tilewidth] == 1
      || scene[(object.y+6)/tileheight][(object.x)/tilewidth] == 1
      || scene[(object.y+6)/tileheight][(object.x+tilewidth-1)/tilewidth] == 1
    ){
        object.x=object.lx;
        object.y=object.ly;
        bound = 1;
        return bound;
  }

  if(    scene[(object.y)/tileheight][(object.x)/tilewidth] == 9
      || scene[(object.y)/tileheight][(object.x+tilewidth-1)/tilewidth] == 9
      || scene[(object.y+6)/tileheight][(object.x)/tilewidth] == 9
      || scene[(object.y+6)/tileheight][(object.x+tilewidth-1)/tilewidth] == 9
    ){
        object.x=object.lx;
        object.y=object.ly;
        bound = 1;
        return bound;
  }

  return bound;
}


#endif // CALCCOLISION_H
