class State {
  State() {
    
  }
  public String participantName;
  public String participantMemory;
  public String filename;
  
  int currentScreen = 0;
  int prevScreen = -1;
  
  public void nextScreen() {
    currentScreen++;
  }
}