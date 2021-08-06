int pantalla = 0;
int ultimaJugada = -1;

TresEnRaya[] miniTableros = new TresEnRaya[9];
color jugador1 = color(200, 156, 44);
color jugador2 = color(156, 44, 200);
color jugador3 = color(44, 200, 156);

color jugadorA;

int numJg = 0; 
int numA = 1;

void setup() {
  size(displayWidth, displayHeight, P2D);
  orientation(PORTRAIT);

  //Instanciar los 3 en raya individuales
  print("Instanciación de los tableros");
  //UpLeft
  miniTableros[0] = new TresEnRaya( 0, 200, 400, 200, 133, 0, 0);
  //Up
  miniTableros[1] = new TresEnRaya( 400, 200, 800, 200, 533, 0, 1);
  //UpRight
  miniTableros[2] = new TresEnRaya( 800, 200, 1200, 200, 933, 0, 2); 

  //MidLeft
  miniTableros[3] = new TresEnRaya( 0, 800, 400, 800, 133, 600, 3);   
  //Mid
  miniTableros[4] = new TresEnRaya( 400, 800, 800, 800, 533, 600, 4);  
  //MidRight
  miniTableros[5] = new TresEnRaya( 800, 800, 1200, 800, 933, 600, 5);   

  //DownLeft
  miniTableros[6] = new TresEnRaya( 0, 1400, 400, 1400, 133, 1200, 6);  
  //Down
  miniTableros[7] = new TresEnRaya( 400, 1400, 800, 1400, 533, 1200, 7);   
  //DownRight
  miniTableros[8] = new TresEnRaya( 800, 1400, 1200, 1400, 933, 1200, 8);
}

void draw() {
  background(255);
  switch(pantalla) {

  case 0:
    fill(0, 102, 153);
    textSize(40);
    text("Seleccione el número de jugadores : ", 270, 600);
    rect(320, 700, 200, 200);  //2
    rect(650, 700, 200, 200);  //3
    fill(255, 255, 255);
    textSize(70);
    text("2", 400, 820);
    text("3", 730, 820);

    break;

  case 1:
    strokeWeight(9);
    stroke(0);
    //Dibujamos las lineas del tablero Principal
    int partiVer =400;
    line(partiVer, 10, partiVer, displayHeight);
    line(partiVer *2, 10, partiVer *2, displayHeight);
    //Dibujamos las lineas del tablero Horizontal
    int partiHor = 600;
    line(10, partiHor, displayWidth, partiHor);
    line(10, partiHor *2, displayWidth, partiHor *2);

    //Dibujamos los 9 TresEnRaya
    //UpLeft
    miniTableros[0].dibujar();
    //Up
    miniTableros[1].dibujar();
    //UpRight
    miniTableros[2].dibujar();
    //MidLeft
    miniTableros[3].dibujar();
    //Mid
    miniTableros[4].dibujar();
    //MidRight
    miniTableros[5].dibujar();
    //DownLeft
    miniTableros[6].dibujar();
    //Down
    miniTableros[7].dibujar();
    //DownRight
    miniTableros[8].dibujar();
    fill(color(255, 0, 0));
    rect(0, 0, 132, 40);
    
    fill(255, 255, 255);
    textSize(30);
    text("Undo", 15, 30);
    break;
  }
}

void mousePressed() {

  if (pantalla == 0) {
    if (mouseX < 600) {
      numJg = 2;
    } else {
      numJg = 3;
    }
    pantalla = 1;
    return;
  }

  boolean jugarSiguiente = true;
  if (mouseX < 130  && mouseY < 40 && ultimaJugada != -1) {
    miniTableros[ultimaJugada].removeFigura();
    jugarSiguiente = false;
    numA--;
    ultimaJugada = -1;
  }
  
  if (jugarSiguiente) {
    
    switch(numA) {
    case 1 :
      jugadorA = jugador1;
      break;
    case 2 :
      jugadorA = jugador2;
      break;
    case 3 :
      jugadorA = jugador3;
      break;
    }

    int index = 0;
    for (TresEnRaya tr : miniTableros) {
      if (tr.comprobarYMarcar(mouseX, mouseY, jugadorA)) {
        ultimaJugada = index;
        numA++;
        if (numA > numJg) numA=1;
        break;
      }
      index++;
    }
    
  }
}
