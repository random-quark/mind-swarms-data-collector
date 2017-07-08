class State {
  State() {
    
  }
  public String participantName;
  public String participantMemory;
  private String filename;
  public String dataDirectory = "eeg_recordings";
  
  int currentScreen = 0;
  int prevScreen = -1;
  
  public void setUserData(String _participantName, String _participantMemory) {
    participantName = _participantName;
    participantMemory = _participantMemory;
    String timestamp = timestamp();
    filename = String.format("%s/%s_%s_%s.csv", dataDirectory, participantName, participantMemory, timestamp);
  }
  
  public String getFilename() {
    return filename;
  }
  
  public String[] getAllData() {
    return new String[] { participantName, participantMemory };
  }
  
  public void returnToStart() {
    currentScreen = 0;
  }
  
  public void nextScreen() {
    currentScreen++;
  }
}