///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
//// MAPA MODULE
////   Controls all the high-level logic that implements the game
////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

#ifndef _KEYBOARD_H_
#define _KEYBOARD_H_

/* TECLADO*/
u8* checkKeyboard(){
  u8 *s = NULL;
  if(cpct_isKeyPressed(Key_Space) && player.atk>=20){
      if(player.atk >= 50) player.atk =0;
      else player.atk += 1;
      switch(player.dir){
        case 4:
            s = gladis_atk_izda;
            break;
        case 6:
            s = gladis_atk_dcha;
            break;
        case 8:
            s = gladis_atk_arriba;
            break;
        case 2:
            s = gladis_atk_abajo;
            break;
        }
  }else{
    if(player.atk < 20) player.atk += 1;
    else player.atk = 20;
    if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
         player.x += 1;
         player.dir = 6;
         s = gladis_quieto_dcha;
      }else if(cpct_isKeyPressed(Key_CursorLeft) && player.x > 0){
         player.x -= 1;
         player.dir = 4;
         s = gladis_quieto_izda;
      }else  if(cpct_isKeyPressed(Key_CursorDown) && player.y < 180){
         player.y += 2;
         player.dir = 2;
         s = gladis_abajo;
      }else if(cpct_isKeyPressed(Key_CursorUp) && player.y > 0 ){
         player.y -= 2;
         player.dir = 8;
         s = gladis_arriba;
      }else if(cpct_isKeyPressed(Key_X) && arrow == 0 && player.atk == 20 && player.bullets >0){
          u8 *spr = flecha_dcha,xs=2,ys=8;
          switch(player.dir){
            case 6: spr = flecha_dcha; xs=4;ys=4; break;
            case 4: spr = flecha_izda; xs=4;ys=4; break;
            case 2: spr = flecha_abajo; xs=2;ys=8; break;
            case 8: spr = flecha_arriba; xs=2;ys=8; break;
          }
          player.atk = 0;
          object.x = player.x;
          object.y = player.y+8;
          object.x = object.x;
          object.y = object.y;
          object.sprite = spr;
          object.vivo = 1;
          object.dir = player.dir;
          object.sizeX = xs;
          object.sizeY = ys;
          player.bullets--;
          arrow=1;
      }else {
        switch(player.dir){
        case 4:
            s = gladis_quieto_izda;
            break;
        case 6:
            s = gladis_quieto_dcha;
            break;
        case 8:
            s = gladis_arriba;
            break;
        case 2:
            s = gladis_abajo;
            break;
        }

      }
  }


  if(cpct_isKeyPressed(Key_L)){
       arrow = 0;
  }
  if(cpct_isKeyPressed(Key_Esc)){
       finish = 1;
  }
  return s;
}

void moveObject(){
  object.lx = object.x;
  object.ly = object.y;
  switch(object.dir){
    case 6: object.x += 1; break;
    case 4: object.x -= 1; break;
    case 2: object.y += 2; break;
    case 8: object.y -= 2; break;
  }
}



#endif
