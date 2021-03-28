// Visualizing sorting algorithms

//Fill the space with poles warying in height.
PVector[] poles = new PVector[100];

//Initial settings of the pole
void setPoles(){
  for(int i=0; i<100; i++){
    poles[i] = new PVector(i*5,int(random(50))*10);
  }
}

void drawPoles(){
  for(int i=0; i<100; i++){
    rect(poles[i].x,500-poles[i].y,5,poles[i].y);
    println("x : " + poles[i].x + " y : " + poles[i].y);
  }
}

// Basic framework is created. Now study and implement the sorting algorithms
/*
void sortPoles(){
  int[] l = new int[50];
  for(int i=0; i<50; i++){ // Transfer all the heights into an array
    l[i] = int(poles[i].y);
  }
  // Selection sort
  int temp=0, min_id;
  for(int i=0; i<50; i++){
    min_id = i;
    for(int j=i+1; j<50; j++){
      if(l[j]<l[min_id]){
        temp = l[min_id];
        l[min_id] = l[j];
        l[j] = temp;
      }
    }
    poles[i].y = l[i];
  }
}
*/

void setup(){
  size(500,500);
  background(0);
  frameRate(5);
  setPoles();
}
int endX = 0;

void draw(){
  background(0);
//  drawPoles();
//  sortPoles();
  if(endX > 100){
    setPoles();
    endX = 0;
  }
  //Draw all the poles which are sorted as white
  for(int i=0; i<100; i++){
    fill(255);
    rect(poles[i].x,500-poles[i].y,5,poles[i].y);
  }
  //Selection sort begins here
  int temp=0, min_id=0;
  for(int i=0; i<endX; i++){//endX is used to synchronize for loop with the draw() loop
    min_id = i;
    for(int j=i+1; j<endX; j++){
      if(poles[j].y<poles[min_id].y){
        fill(0,255,0);
        rect(poles[j].x,500-poles[j].y,5,poles[j].y);//Draw the minimum pole as green

        temp = int(poles[min_id].y); // Swap the ith pole with the minimum in the current loop
        poles[min_id].y = poles[j].y;
        poles[j].y = temp;
      }
    }
  }

  for(int i=endX; i<100; i++){
    fill(255,0,0);
    rect(poles[i].x,500-poles[i].y,5,poles[i].y);// Draw all the poles which are not sorted as red.
  }

  endX++;
}
