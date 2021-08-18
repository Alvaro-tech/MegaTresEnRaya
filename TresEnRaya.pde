class TresEnRaya {
   
  ArrayList<Figura> figuras; 
  public int numFig = 0;
  boolean isLinea = false;
  color colorMarco = color(180,180,180);
  
  int posX1;
  int posY1;
  
  int posX2;
  int posY2;
  
  int posX3;
  int posY3;
  
  FigInd[] indicesF = new FigInd[9];
  int nTablero;
  
  int ultPos;
  boolean hayLin = false;
  
  public boolean isInUso = false;
    
  //PosX = Altura inicial en X de la primera linea horizontal
  //PosY = Altura inicial en Y de la primera linea vertical
  TresEnRaya(int posx_, int posy_, int posx2, int posy2, int posx3, int posy3, int _nt) {
    figuras = new ArrayList<Figura>();
    this.posX1 = posx_;
    this.posY1 = posy_;
    this.posX2 = posx2;
    this.posY2 = posy2;
    this.posX3 = posx3;
    this.posY3 = posy3;
    this.nTablero = _nt;
  }
  
  public void dibujar(){
    strokeWeight(2);
    if(numFig >= 9 || hayLin) {
      colorMarco = color(red(colorMarco), green(colorMarco), blue(colorMarco), 150);
      fill(colorMarco);
      rect(posX1, posY3, 398,598);
    } 
     fill(255);
     //Dibujamos las lineas del tablero Vertical Principal
     line(posX3,posY3,posX3,posY3 + 600);
     line(posX3 + 133 , posY3 , posX3+133, posY3 + 600);
     //Dibujamos las lineas del tablero Horizontal
     line(posX1, posY1,posX2, posY2);
     line(posX1, posY1 + 200, posX2, posY2 + 200);
     
     //Dibujar las figuras
     for(Figura f : figuras){
      f.dibujar();
     }
     
  }
  
  public boolean marcarFigura(int _posX, int _posY, color _jugador) {
    if(numFig >= 9) return false;
    numFig++;
    Figura aux = new Figura(_posX, _posY, _jugador);
    this.asignarFigura(_posX, _posY, _jugador);
    figuras.add(aux);
    if(!hayLin)this.checkLinea();
    return true;
    
  }
  
  public boolean comprobarYMarcar(int _posX, int _posY, color _jugador){
    if( _posX >= posX1 && _posX <= posX2  
      && _posY >= posY3  && _posY <= (posY3 +600)){
        return this.marcarFigura(_posX, _posY, _jugador);
      }
      return false;
  }
  
  private void checkLinea(){
    //colorFondo = color(200, 156, 44,150);
    //Lineas Horizontales
    if(indicesF[0] != null && indicesF[1] != null && indicesF[2] != null
       && indicesF[0].jugador == indicesF[1].jugador && indicesF[2].jugador == indicesF[1].jugador ){
      colorMarco = indicesF[0].jugador;
      hayLin = true;
      return;
    }
    if(indicesF[3]!= null && indicesF[4] != null && indicesF[5] != null
    && indicesF[3].jugador == indicesF[4].jugador && indicesF[4].jugador == indicesF[5].jugador){
      colorMarco = indicesF[3].jugador;
      hayLin = true;
      return;
    }
    if(indicesF[6] != null && indicesF[7] != null && indicesF[8] != null
    && indicesF[6].jugador == indicesF[7].jugador && indicesF[7].jugador == indicesF[8].jugador){
      colorMarco = indicesF[6].jugador;
      hayLin = true;
      return;
    }
    
    //Lineas Verticales
    if(indicesF[0] != null && indicesF[3] != null && indicesF[6] != null
    && indicesF[0].jugador == indicesF[3].jugador && indicesF[3].jugador == indicesF[6].jugador){
      colorMarco = indicesF[0].jugador;
      hayLin = true;
      return;
    }
    
    if(indicesF[1] != null && indicesF[4] != null && indicesF[7] != null
    && indicesF[1].jugador == indicesF[4].jugador && indicesF[4].jugador == indicesF[7].jugador){
      colorMarco = indicesF[1].jugador;
      hayLin = true;
      return;
    }
    
    if(indicesF[2] != null && indicesF[5] != null && indicesF[8] != null
    && indicesF[2].jugador == indicesF[5].jugador && indicesF[5].jugador == indicesF[8].jugador){
      colorMarco = indicesF[2].jugador;
      hayLin = true;
      return;
    } 
    
    //Lineas diagonales
    if(indicesF[0] != null && indicesF[4] != null && indicesF[8] != null
    && indicesF[0].jugador == indicesF[4].jugador && indicesF[4].jugador == indicesF[8].jugador){
      colorMarco = indicesF[0].jugador;
      hayLin = true;
      return;
    }
    if(indicesF[2] != null && indicesF[4] != null && indicesF[6] != null
    && indicesF[2].jugador == indicesF[4].jugador && indicesF[4].jugador == indicesF[6].jugador){
      colorMarco = indicesF[2].jugador;
      hayLin = true;
      return;
    }
    
  }
  
  private void asignarFigura(int _posX, int _posY, color fondo){
    int inicioTop = posY1 - 200;    
    //Primera fila
    if(_posY > inicioTop && _posY < posY1){
        //1
        if(_posX > posX1 && _posX < posX1 + 133){
          indicesF[0] = new FigInd(fondo);
          ultPos = 0;
          println("# -> Tablero: " + nTablero + " Casilla: " + "1" );
        }
        //2
        if(_posX > posX1 + 133 && _posX < posX1 + (2*133)){
          indicesF[1] = new FigInd(fondo);
          ultPos = 1;
          println("# -> Tablero: " + nTablero + " Casilla: " + "2" );
        }
        //3
        if(_posX > posX1 + (2*133) && _posX < posX1 + (3*133)){
          indicesF[2] = new FigInd(fondo);
          ultPos = 2;
          println("# -> Tablero: " + nTablero + " Casilla: " + "3" );
        }
    }
    inicioTop += 200;
    //Segunda fila
    if(_posY > inicioTop && _posY < posY1 + 200){
        //4
        if(_posX > posX1 && _posX < posX1 + 133){
          indicesF[3] = new FigInd(fondo);
          ultPos = 3;
          println("# -> Tablero: " + nTablero + " Casilla: " + "4" );
        }
        //5
        if(_posX > posX1 + 133 && _posX < posX1 + (2*133)){
          indicesF[4] = new FigInd(fondo);
          ultPos = 4;
          println("# -> Tablero: " + nTablero + " Casilla: " + "5" );
        }
        //6
        if(_posX > posX1 + (2*133) && _posX < posX1 + (3*133)){
          indicesF[5] = new FigInd(fondo);
          ultPos = 5;
          println("# -> Tablero: " + nTablero + " Casilla: " + "6" );
        }
    }
    inicioTop += 200;
    //Tercera Fila
    if(_posY > inicioTop && _posY < posY1 + 400){
        //7
        if(_posX > posX1 && _posX < posX1 + 133){
          indicesF[6] = new FigInd(fondo);
          ultPos = 6;
          println("# -> Tablero: " + nTablero + " Casilla: " + "7" );
        }
        //8
        if(_posX > posX1 + 133 && _posX < posX1 + (2*133)){
          indicesF[7] = new FigInd(fondo);
          ultPos = 7;
          println("# -> Tablero: " + nTablero + " Casilla: " + "8" );
        }
        //9
        if(_posX > posX1 + (2*133) && _posX < posX1 + (3*133)){
          indicesF[8] = new FigInd(fondo);
          ultPos = 8;
          println("# -> Tablero: " + nTablero + " Casilla: " + "9" );
        }
    }
  }
  
  public void removeFigura(){
    figuras.remove(figuras.size() - 1);
    numFig--;
    hayLin = false;
    colorMarco = color(180,180,180);
    indicesF[ultPos] = null;
    this.checkLinea();
    
  }
}