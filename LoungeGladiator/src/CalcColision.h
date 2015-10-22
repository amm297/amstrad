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

u8 checkArrowCollisions(){

    u8 bound =0;
        if(    scene[(parrow.y)/tileheight][(parrow.x)/tilewidth] == 1
      || scene[(parrow.y)/tileheight][(parrow.x+tilewidth-1)/tilewidth] == 1
      || scene[(parrow.y+6)/tileheight][(parrow.x)/tilewidth] == 1
      || scene[(parrow.y+6)/tileheight][(parrow.x+tilewidth-1)/tilewidth] == 1
    ){
        parrow.x=parrow.lx;
        parrow.y=parrow.ly;
        bound = 1;
        return bound;
  }

  if(    scene[(parrow.y)/tileheight][(parrow.x)/tilewidth] == 9
      || scene[(parrow.y)/tileheight][(parrow.x+tilewidth-1)/tilewidth] == 9
      || scene[(parrow.y+6)/tileheight][(parrow.x)/tilewidth] == 9
      || scene[(parrow.y+6)/tileheight][(parrow.x+tilewidth-1)/tilewidth] == 9
    ){
        parrow.x=parrow.lx;
        parrow.y=parrow.ly;
        bound = 1;
        return bound;
  }

  return bound;
}


#endif // CALCCOLISION_H
