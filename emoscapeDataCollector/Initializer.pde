class Initializer implements StateInterface {
  boolean alreadyRan = false;
  boolean errorDrawn = false;
  
  PImage bluetoothExample;
  PImage[] museImg = new PImage[2];
  //Movie museOnVideo;
  
  Initializer(PApplet p) {
    bluetoothExample = loadImage("bluetooth-example.png");
    museImg[0] = loadImage("museOn.png");
    museImg[1] = loadImage("museOff.png");    
  }

  void setup() {
    
  }

  void draw() {
    if (!museInstalled()) {
      if (!errorDrawn) {
        drawError("Please install Muse software first\nAvailable from http://developer.choosemuse.com/research-tools");
        link("http://developer.choosemuse.com/research-tools");
        errorDrawn = true;
      }
    }
    else turnOnMuse();
  }

  boolean museInstalled() {
    File f = new File("/Applications/Muse/muse-io");
    if (f.exists()) return true;
    else return false;
  }

  void drawError(String errorMsg) {
    pushStyle();
    background(255, 0, 0);
    textSize(25);
    float textW = textWidth(errorMsg);
    pushMatrix();
    translate(width/2 - textW/2, height/2);
    text(errorMsg, 0, 0);
    popMatrix();
    popStyle();
  }

  void turnOnMuse() {
    alreadyRan=true;
    
    if (collector.isConnectedToMuse()) state.nextScreen();
    
    String[] messages = {
      "Ensure bluetooth is turned on",
      "You may need to pair the EEG reader first",
      "Click bluetooth icon in menu bar > Open Bluetooth Preferences > Click 'Pair' button next to muse (If 'Pair' button not shown, already paired)",      
      "Turn on the Muse EEG reader",
      "Hold down power button for 5 seconds\nuntil all lights flash on and off at the same time",
      "Once EEG reader and bluetooth are on, app will automatically proceed to next step",
    }; 
    
    int margin = 12;
    int title = 25;
    int subtitle = 20;
    int small = 14;
    
    pushStyle();
    background(255);
            
    // TURN ON MUSE
    pushMatrix();
    pushStyle();
    fill(0);
    stroke(0);
    image(museImg[(millis()/1000)%2], 0, 0);
    textSize(title);
    textAlign(LEFT, TOP);
    text(messages[3], margin, margin);
   
    textAlign(LEFT, TOP);
    textSize(subtitle);
    text(messages[4], margin, margin + title + 10);
    popStyle();
    popMatrix();

    // TURN ON BLUETOOTH
    pushMatrix();
    translate(0, height /2 );
    image(bluetoothExample, width-bluetoothExample.width, 0);
    fill(255);
    stroke(255);
    rect(0, height / 2, width, height / 2);
    
    textAlign(LEFT, TOP);
    
    stroke(0); 
    fill(0);
    textSize(title);    
    text(messages[0], margin, margin + 15);
    textSize(small);
    text(messages[5], margin, margin + 15 + title + 8);
    
    pushStyle();
    color c = color(255, 220);
    fill(c);
    stroke(c);
    rect(0, (height/2) - margin - small - subtitle - 20, width, margin + small + subtitle + 20);
    popStyle();
    
    textSize(subtitle);
    text(messages[1], margin, (height/2) - margin - small - subtitle - 10);
    textSize(small);
    text(messages[2], margin, (height/2) - margin - small);    
    popMatrix();
    
    popStyle();
  }
  
    void exit(){}
}