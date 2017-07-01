class CountDown implements StateInterface {
  State state;
  Recorder recorder;
  Collector collector;
  boolean timerStarted = false;
  int timer;
  int lastTime;
  
  CountDown(State _state) {
    state = _state;
    
    collector = new Collector();
  }
  
  void setup() {
  }
  
  void recordData() {
    // do recording
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
    
    // show some funky data viz while data is being recorded
    
    // do the record
    collector.collect();
    
    timer -= (millis() - lastTime);
    lastTime = millis();
    if (timer <= 0) {
      collector.stop();
      state.nextScreen();
    }
  }
}