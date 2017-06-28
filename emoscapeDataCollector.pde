import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

StateInterface countDown, dataSharer, userSetup, initializer;

PApplet commandLine;

ArrayList<StateInterface> states = new ArrayList<StateInterface>();

int currentState = 3;

void setup() {
  State state = new State();
  size(800, 500);
  background(255);
  
  initializer = new Initializer();
  userSetup = new UserSetup(this);
  countDown = new CountDown();
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
  states.get(3).draw();
}

String sysExec(String command) {
  try {
    String response = "";
    Process process = Runtime.getRuntime().exec(command);                    
    BufferedReader reader = new BufferedReader(new InputStreamReader(        
      process.getInputStream()));                                          
    String s;                                                                
    while ((s = reader.readLine()) != null) {                                
      //System.out.println("Script output: " + s);
      response += s + " ";
    }
    return(response);
  } 
  catch (IOException ioe) {
    ioe.printStackTrace();
    return "error";
  }
}