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
    
    textSize(50);
    text(String.format("Data collection for (%d) complete", state.participantName), 0, 0);
    text(String.format("A file has been saved called '(%d)' in the directory that the software is in", state.dataFilename), 0, 0);
    text("Please send this file to saatchi@randomquark.com", 0, 0);
    text("Press escape to quit program", 0, 0);
  }
}