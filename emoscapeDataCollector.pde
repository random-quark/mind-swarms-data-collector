import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

StateInterface initializer, userSetup, record, share;

PApplet commandLine;

ArrayList<StateInterface> states = new ArrayList<StateInterface>();

int recordingTime = 20; // seconds FIXME: this should be in a config object passed into instances
State state; // fixme: the main part of the app should be a class to avoid state being global
Collector collector; // FIXME: should be a singleton instantiated in each class

boolean DEBUG = true;

void setup() {
  //fullScreen();
  size(1200, 800);
  
  if (DEBUG) {
    recordingTime = 2;
  }  
  
  background(255);

  state = new State();
  collector = new Collector(state);

  initializer = new Initializer(this);
  userSetup = new UserSetup(this, state);
  record = new Record(state, collector);
  share = new Share(state);

  states.add(initializer);
  states.add(userSetup);
  states.add(record);
  states.add(share);

  state.currentScreen = 0; // change this to see different screens while debugging 
  if (!DEBUG) state.currentScreen = 0; // DO NOT CHANGE. always show first screen if not debugging, regardless of manual override
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  if (state.prevScreen !=state.currentScreen) {
    if (state.prevScreen>=0) states.get(state.prevScreen).exit(); //exit previous state (if it exists)
    states.get(state.currentScreen).setup();
    state.prevScreen = state.currentScreen;
  }

  states.get(state.currentScreen).draw();
}