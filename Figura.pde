class Figura{
  int posX;
  int posY;
  int tam = 60;
  color jugadorC;  
  
  Figura(int _posX, int _posY, color _jugador){
    posX = _posX;
    posY= _posY;
    jugadorC = _jugador;
    this.dibujar();
  }  
  
  public void dibujar(){
    fill(jugadorC);
    ellipse(posX,posY, tam, tam);
  }
  
}
