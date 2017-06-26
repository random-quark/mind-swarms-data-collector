import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

StateInterface countDown, dataSharer, userSetup, initializer;

PApplet commandLine;

ArrayList<StateInterface> states = new ArrayList<StateInterface>();

void setup() {
  size(800, 500);
  background(255);
  countDown = new CountDown();
  dataSharer = new DataSharer();
  userSetup = new UserSetup(this);
  initializer = new Initializer();

  states.add(initializer);
  states.add(userSetup);
  states.add(countDown);
  states.add(dataSharer);

  states.get(0).setup();
  //println(sysExec("top"));
}

void draw() {
  background(0);
  states.get(2).draw();
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