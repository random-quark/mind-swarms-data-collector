class DataSharer implements StateInterface {
  State state;
  
  DataSharer(State _state) {
    state = _state;
  }

  void setup() {
    println("datasharer class setup");
  }

  void draw() {
    // show in middle of screen
    // make headline bold
    // size text properly
    
    int x = 0;
    int y = height / 2;
    int lineHeight = 50;
    
    textSize(lineHeight);
    text(String.format("Data collection for (%d) complete", state.participantName), x, y);
    y += lineHeight;
    text(String.format("A file has been saved called '(%d)' in the directory that the software is in", state.dataFilename), x, y);
    y += lineHeight;
    text("Please send this file to saatchi@randomquark.com", x, y);
    y += lineHeight;
    textSize(20);
    text("Press escape to quit program", x, y);
  }
  
    void exit(){}
}