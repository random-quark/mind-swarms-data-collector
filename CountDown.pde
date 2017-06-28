class CountDown implements StateInterface {
  State state;
  boolean timerStarted = false;
  int timer;
  int lastTime;
  
  CountDown(State _state) {
    state = _state;
  }
  
  void setup() {
  }

  void draw() {
    if (!timerStarted) {
      timer = recordingTime * 1000;
      timerStarted = true;
    }
    
    pushStyle();
    color(255);
    ellipse(width / 2, 100,100,100);
    color(0);
    textSize(100);
    text(timer / 1000, width / 2, 100);
    popStyle();
    
    timer -= (millis() - lastTime);
    lastTime = millis();
    if (timer <= 0) {
      state.nextScreen();
    }
  }
}