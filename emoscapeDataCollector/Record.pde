class Record implements StateInterface {
  State state;
  Collector collector;
  boolean timerStarted = false;
  int timer;
  int lastTime;

  Record(State _state, Collector _collector) {
    state = _state;
    collector = _collector;
  }

  void setup() {
    timer = recordingTime * 1000;
    lastTime = millis();
    timerStarted = true;
  }

  void draw() {
    if (!collector.isConnectedToMuse()) {
      state.returnToStart(); // if connection is lost go back to 1st screen
    }    
    
    background(collector.getCurrentStateAsColor());

    pushStyle();
    fill(255);
    ellipse(width / 2, height / 2, 300, 300);
    fill(0);
    textSize(180);
    textAlign(CENTER, CENTER);
    text(timer / 1000, width / 2, (height / 2) - 20);
    popStyle();

    if (timerStarted) {
      timer -= (millis() - lastTime);
      lastTime = millis();
      if (timer <= 0) {
        collector.stop();
        state.nextScreen();
      }
      
      collector.collect();
    }
  }

  void exit(){}
}