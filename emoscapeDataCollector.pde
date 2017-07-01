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

void setup() {
  size(800, 500);
  background(255);

  state = new State();

  initializer = new Initializer();
  userSetup = new UserSetup(this, state);
  record = new Record(state);
  share = new Share(state);

  states.add(initializer);
  states.add(userSetup);
  states.add(record);
  states.add(share);

  state.currentScreen = 2;
}

void draw() {
  background(0);

  if (state.prevScreen !=state.currentScreen) {
    if (state.prevScreen>=0) states.get(state.prevScreen).exit(); //exit previous state (if it exists)
    states.get(state.currentScreen).setup();
    state.prevScreen = state.currentScreen;
  }

  states.get(state.currentScreen).draw();
}

//String sysExec(String command) {
//  try {
//    String response = "";
//    Process process = Runtime.getRuntime().exec(command);
//    BufferedReader reader = new BufferedReader(new InputStreamReader(
//      process.getInputStream()));
//    String s;
//    while ((s = reader.readLine()) != null) {
//      //System.out.println("Script output: " + s);
//      response += s + " ";
//    }
//    return(response);
//  }
//  catch (IOException ioe) {
//    ioe.printStackTrace();
//    return "error";
//  }
//}

void keyPressed() {
  if (keyCode == ENTER)
  {
    if (state.currentScreen >= states.size()) return;
    state.currentScreen++;
  }
}