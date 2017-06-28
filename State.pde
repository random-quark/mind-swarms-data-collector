class State {
  State() {
    
  }
  public String participantName;
  public String dataFilename;
  
  int currentScreen = 2;
  
  public void nextScreen() {
    currentScreen++;
  }
}