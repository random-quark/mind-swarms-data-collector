class State {
  State() {
    
  }
  public String participantName;
  public String dataFilename;
  
  int currentScreen = 0;
  
  public void nextScreen() {
    currentScreen++;
  }
}