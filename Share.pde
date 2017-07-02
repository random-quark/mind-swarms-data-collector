class Share implements StateInterface {
  State state;
  
  Share(State _state) {
    state = _state;
  }

  void setup() {
    println("datasharer class setup");
  }

  void draw() {
    // show in middle of screen
    // make headline bold
    // size text properly
    
    int x = width / 2;
    int textSize = 25;
    int lineHeight = textSize + 10;
    int y = lineHeight;
    
    pushStyle();
    background(255);
    color(0);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(textSize);
    text("Data collection for", x, y);
    y += lineHeight;
    text(String.format("(%d)", state.participantName), x, y);
    y += lineHeight;
    text("complete", x, y);
    y = height / 2;
    text("A file has been saved called", x, y);
    y += lineHeight;
    text(String.format("(%d)", state.dataFilename), x, y);
    y += lineHeight;
    text("in the directory that the software is in", x, y);
    y += lineHeight * 2;
    text("Please send this file to saatchi@randomquark.com", x, y);
    y += lineHeight;
    textSize(20);
    text("Press escape to quit program", x, height - 30);
    popStyle();
  }
  
    void exit(){}
}