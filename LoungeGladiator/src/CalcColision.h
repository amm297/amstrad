#ifndef CALCCOLISION_H
#define CALCCOLISION_H




u8 checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8 atk){
    u8 popX = pX + tilewidth;
    u8 popY = pY + tileheight;
    u8 eopX = eX + tilewidth;
    u8 eopY = eY + tileheight;

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


#endif // CALCCOLISION_H
