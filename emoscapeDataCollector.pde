import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

StateInterface countDown, dataSharer, userSetup, initializer;

PApplet commandLine;

ArrayList<StateInterface> states = new ArrayList<StateInterface>();

int recordingTime = 20; // seconds FIXME: this should be in a config object passed into instances
State state = new State(); // fixme: the main part of the app should be a class to avoid state being global

void setup() {
  size(800, 500);
  background(255);

  initializer = new Initializer();
  userSetup = new UserSetup(this);
  countDown = new CountDown(state);
  dataSharer = new DataSharer(state);

  states.add(initializer);
  states.add(userSetup);
  states.add(countDown);
  states.add(dataSharer);

  states.get(0).setup();
  //println(sysExec("top"));
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
    state.currentScreen++;
  }
}