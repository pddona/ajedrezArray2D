//TABLERO DE AJEDREZ  por Daniel Doña Ibáñez 2020 IES Alminares
//Nomenclatura Peón  Alfil   Torre  Caballo   Rey    Reina
//             pawn  bishop   rook  knight    king   queen
//               0     1       2      3        4      5
PImage[][] tablero;//ARRAY DE 2D para guardar la distribución del tablero
PImage[] negras;//Lista de imágenes    ARRAY 1D
PImage[] blancas;//Lista de imágenes    ARRAY 1D
float sizeC;//tamaño de los cuadritos del tablero

void setup() {
  size(800,800);
  noLoop();  // DRAW()  solo se ejecuta una vez
  sizeC = width/10;// 1+8+1   margen+8cuadrados+margen
  
  //IMÁGENES
  negras = new PImage[6];//6 figuras distintas
  negras[0] = loadImage("negras/pawn.png");
  negras[1] = loadImage("negras/bishop.png");
  negras[2] = loadImage("negras/rook.png");
  negras[3] = loadImage("negras/knight.png");
  negras[4] = loadImage("negras/king.png");
  negras[5] = loadImage("negras/queen.png");
  blancas = new PImage[6];//6 figuras distintas
  blancas[0] = loadImage("blancas/pawn.png");
  blancas[1] = loadImage("blancas/bishop.png");
  blancas[2] = loadImage("blancas/rook.png");
  blancas[3] = loadImage("blancas/knight.png");
  blancas[4] = loadImage("blancas/king.png");
  blancas[5] = loadImage("blancas/queen.png");
    
  tablero = new PImage[8][8];//TABLERO 8x8
  //TABLERO CARGAR NEGRAS  
  for(int f=0;f<8;f++){
      tablero[f][1]=negras[0];//8 PEONES NEGROS
  }
  tablero[0][0]=negras[2];//TORRE NEGRA
  tablero[7][0]=negras[2];//TORRE NEGRA
  tablero[1][0]=negras[3];//CABALLO NEGRO
  tablero[6][0]=negras[3];//CABALLO NEGRO
  tablero[2][0]=negras[1];//ALFIL NEGRO
  tablero[5][0]=negras[1];//ALFIL NEGRO
  tablero[3][0]=negras[4];//REY NEGRO
  tablero[4][0]=negras[5];//REINA NEGRA
  
  //TABLERO CARGAR BLANCAS
  for(int f=0;f<8;f++){
      tablero[f][6]=blancas[0];//8 PEONES BLANCOS
  }
  tablero[0][7]=blancas[2];//TORRE BLANCA
  tablero[7][7]=blancas[2];//TORRE BLANCA
  tablero[1][7]=blancas[3];//CABALLO BLANCO
  tablero[6][7]=blancas[3];//CABALLO BLANCO
  tablero[2][7]=blancas[1];//ALFIL BLANCO
  tablero[5][7]=blancas[1];//ALFIL BLANCO
  tablero[3][7]=blancas[4];//REY BLANCO
  tablero[4][7]=blancas[5];//REINA BLANCA
}

void draw() {
  background(#84C0F2);//azulado
  //DIBUJAR PRIMERO EL TABLERO
  dibujarTablero();//funcion definida más abajo  
  //DIBUJAR LAS FIGURAS
  dibujarFiguras();//funcion definida más abajo
  save("ajedrez.png");//captura de ventana
}

// FUNCION PROPIA DEFINIDA POR EL PROGRAMADOR
void dibujarTablero(){
  color blanco=#FFFFFF;
  color negro=#000000;
  int i , j;
  for(i=0;i<8;i++){
    for(j=0;j<8;j++){
      if(  (i+j)%2==0  ){
              fill(negro);  
      }else{  
              fill(blanco);  
      }    
      rect(i*sizeC+sizeC,j*sizeC+sizeC,sizeC,sizeC);
    }
  }
}

// FUNCION PROPIA DEFINIDA POR EL PROGRAMADOR
void dibujarFiguras(){
  for(int i=0;i<8;i++){
    for(int j=0;j<8;j++){
      if(  tablero[i][j]!=null  ){
          image(tablero[i][j],i*sizeC+sizeC,j*sizeC+sizeC,sizeC,sizeC); 
      }       
    }
  }
}
