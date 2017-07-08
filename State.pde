class State {
  State() {
    
  }
  public String participantName;
  public String participantMemory;
  public String filename;
  public String dataDirectory = "eeg_recordings";
  
  int currentScreen = 0;
  int prevScreen = -1;
  
  public void setUserData(String _participantName, String _participantMemory) {
    participantName = _participantName;
    participantMemory = _participantMemory;
    filename = dataDirectory + "/" + state.participantName + "_" + timestamp() + ".csv";
    filename = String.format("%s/%s_%s_%d.csv", dataDirectory, participantName, participantMemory, timestamp());
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