class Initializer implements StateInterface {
  //boolean museInstalled = false;
  Initializer() {
  }

  void setup() {
    println("initalizer class setup");
  }

  void draw() {
    if (!       museInstalled()) drawError("Please install Muse software first");
    else turnOnMuse();
  }

  boolean museInstalled() {
    File f = new File("/Applications/Muse/muse-io");
    if (f.exists()) return true;
    else return false;
  }

  void drawError(String errorMsg) {
    background(255, 0, 0);
    textSize(25);
    float textW = textWidth(errorMsg);
    pushMatrix();
    translate(width/2 - textW/2, height/2);
    text(errorMsg, 0, 0);
    popMatrix();
  } 

  void turnOnMuse() {
    String msg = "Turn on Muse \n (press any key when ready)";
    textAlign(CENTER);

    background(255);
    textSize(25);
    stroke(0); 
    fill(0);
    text(msg, width/2, height/2);
  }
}