///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
//// MAPA MODULE
////   Controls all the high-level logic that implements the game
////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

#ifndef _DRAWS_H_
#define _DRAWS_H_

void endGame(){
    u8* memptr;
  cpct_clearScreen(0);
  memptr = cpct_getScreenPtr(VMEM,10,10);
  cpct_drawStringM0("Congratulations",memptr,1,0);

  memptr = cpct_getScreenPtr(VMEM,2,180);
   cpct_drawStringM0("Pulsa cualquier tecla",memptr,1,0);

  while(1){
    cpct_scanKeyboard_f();
    if(cpct_isKeyPressed(Key_Space)) return;
  }
}


void vaciar(){
  u8 x=0,y=0;
  for(y=0;y<height;y++){
        for(x=0;x<width;x++){
          scene[y][x] = 0;
        }
      }
}


void mapSelector(u8 t){
  u8 x=0,y=0,aux =0; 
  vaciar();
  switch(t){
    case 1: 
      for(y=0;y<height;y++){
        for(x=0;x<width;x++){
          scene[y][x] = mapa1[y][x];
        }
      }
    break;
    case 2:
      for(y=0;y<height;y++){
        for(x=0;x<width;x++){
          scene[y][x] = mapa2[y][x];
        }
      }
    break;
    case 3: 
      for(y=height-1;y!=0;y--){
        for(x=0;x<width;x++){
          scene[aux][x] = mapa1[y][x];
        }
        aux++;
      }
      for(x=0;x<width;x++){
          scene[aux][x] = mapa1[0][x];
        }
    break;
    case 4:
      for(y=height-1;y!=0;y--){
        for(x=0;x<width;x++){
          scene[aux][x] = mapa2[y][x];
        }
        aux++;
      }
      for(x=0;x<width;x++){
          scene[aux][x] = mapa2[0][x];
        }
    break;
  }
}
/*MAPA*/
void drawMap(u8 t){
   u8 posX=0,posY =0;
   u8 aux = 0;
   u8* memptr;

   mapSelector(t);

   for(posY=0; posY<height;posY++){
      for(posX=0; posX<width;posX++){
         memptr = cpct_getScreenPtr(VMEM, posX*tilewidth, posY*tileheight);
         if(scene[posY][posX] == 1){
            cpct_drawSprite(muro,memptr,tilewidth, tileheight);
         }
         if(scene[posY][posX] == 9){
          if(aux == 0){
           cpct_drawSprite(g_tile_puerta_0,memptr,tilewidth, tileheight);
           aux += 1;
         }
          else cpct_drawSprite(g_tile_puerta_1,memptr,tilewidth, tileheight);
         }
      }
   }
}

/*VIDA*/
void drawVida(u8 life,u8 pos,u8 lim){

  u8* memptr;
     u8 p = pos;
     u8 i =1;
     for(i=1;i<=5;i++){
      memptr = cpct_getScreenPtr(VMEM,p,192);
      p+=5;
      if(i<=life)  cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
      else {
        if(i<=lim){
          cpct_drawSolidBox(memptr,0,4,8);
          cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
        }
      }
     }

}
/*PROYECTILES*/
void drawBullets(u8 bullet,u8 pos){
     u8* memptr;
     int p = pos;
     u8 i =1;
     for(i=1;i<=3;i++){
      memptr = cpct_getScreenPtr(VMEM,p,192);
      p+=3;
      if(i<=bullet) cpct_drawSpriteMasked(flecha_arriba, memptr, 2, 8);
      else  cpct_drawSolidBox(memptr,0,2,8);
     }

}


/*PERSONAJES*/

void draw(u8 x,u8 y,u8 *sprite,u8 mode){
    u8* memptr;
        memptr = cpct_getScreenPtr(VMEM,x,y);
        switch(mode){
        case 0:
            cpct_drawSpriteMasked(sprite, memptr, 4, 16);
            break;
        case 1:
            cpct_drawSpriteMasked(sprite, memptr, 2, 8);
            break;
        case 2:
            cpct_drawSpriteMasked(sprite, memptr, 4, 4);
            break;
        }

}

void erase(u8 x,u8 y,u8 mode){
    u8* memptr;

    memptr = cpct_getScreenPtr(VMEM,x,y);
    switch(mode){
    case 0:
        cpct_drawSolidBox(memptr,0,4,16);
        break;
    case 1:
        cpct_drawSolidBox(memptr,0,2,8);
        break;
    case 2:
        cpct_drawSolidBox(memptr,0,4,4);
        break;
    }
}

void drawStats(){
    drawVida(player.life,1,3);
    drawBullets(player.bullets,16);
    drawVida(enemy.life,enemy.lp,map);

}


void draws(){
    u8 i=0;
    if(temp%2 == 0)
        draw(player.x,player.y,player.sprite,0);
    if(enemy.life > 0 && temp%2 == 1)
        draw(enemy.x,enemy.y,enemy.sprite,0);
    if(arrow == 1){
        if(object.dir == 4 || object.dir == 6 && object.vivo == 1)
            draw(object.x,object.y,object.sprite,2);
        else if(object.dir == 2 || object.dir == 8 && object.vivo == 1)
            draw(object.x,object.y,object.sprite,1);
    }
    drawStats();
}

void erases(){
    u8 i=0;
    if(temp%2 == 0)
        erase(player.lx,player.ly,0);
    if(temp%2 == 1 && enemy.life > 0)
        erase(enemy.lx,enemy.ly,0);
 if(arrow == 1){
        if(object.dir == 4 || object.dir == 6)
            erase(object.lx,object.ly,2);
        else
            erase(object.lx,object.ly,1);
        if(bound == 1) arrow = 0;
    }
}


/*FATIGA*/

void drawFatiga(u8 atk, u8 col){
  u8* memptr;
    if(atk < 20)
        col = 2;
    if(atk > 30 || atk <= 20){
        memptr = cpct_getScreenPtr(VMEM,28,192);
        switch(col){
        case 0:
            cpct_drawSolidBox(memptr, col, 2, 8);
            break;
        case 1:
            cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
            break;
        case 2:
            cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
        }
    }
    if(atk > 40 || atk <= 20){
        memptr = cpct_getScreenPtr(VMEM,31,192);
        switch(col){
        case 0:
            cpct_drawSolidBox(memptr, col, 2, 8);
            break;
        case 1:
            cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
            break;
        case 2:
            cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
        }
    }
    if(atk <= 20){
        memptr = cpct_getScreenPtr(VMEM,34,192);
        switch(col){
        case 0:
            cpct_drawSolidBox(memptr, col, 2, 8);
            break;
        case 2:
            cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
        }
    }
}

/*PICK-UPS*/
void drawPickUps(u8 corazon, u8 bullet){
    u8* memptr;

    memptr = cpct_getScreenPtr(VMEM, originsu[map-1][0],originsu[map-1][1] );
    if(corazon == 0)
        cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
    else
        cpct_drawSolidBox(memptr, 0, 4, 8);

    memptr = cpct_getScreenPtr(VMEM, originsu[map-1][2],originsu[map-1][3]);
    if(bullet == 0)
        cpct_drawSpriteMasked(flecha_arriba,memptr,2,8);
    else
        cpct_drawSolidBox(memptr, 0, 2, 8);

}





#endif
