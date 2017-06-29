class State {
  State() {
    
  }
  public String participantName;
  public String dataFilename;
  
  int currentScreen = 0;
  int prevScreen = -1;
  
  public void nextScreen() {
    currentScreen++;
  }
}