import controlP5.*;

class UserSetup implements StateInterface {
  ControlP5 cp5;
  String url1, url2;
  ControlGroup ctrl;
  MyControlListener myListener;
  PFont pfont;
  ControlFont font;

  UserSetup(PApplet p, State _state) {
    pfont = createFont("Arial", 20, true); // use true/false for smooth/no-smooth
    font = new ControlFont(pfont, 15);
    cp5 = new ControlP5(p);
    state = _state;

    // change the original colors
    //cp5.setColorForeground(0xffaa0000);
    cp5.setColorBackground(0xff99ccff);
    cp5.setColorCaptionLabel(0);
    cp5.setFont(font);
    cp5.setColorActive(0xff000000);
  }

  void setup() {
    println("userSetup class setup");
    cp5.addTextfield("Subject Forename & Surname").setPosition(20, 20).setSize(400, 40).setAutoClear(false).setFont(font).setColorValue(0);
    cp5.addTextfield("Memory description").setPosition(20, 90).setSize(400, 40).setAutoClear(false).setFont(font).setColorValue(0);
    cp5.addBang("start session").setPosition(width/2-120/2, height/2 + 30).setSize(120, 40).setFont(font).hide();
    myListener = new MyControlListener();
    cp5.getController("start session").addListener(myListener);
  }

  void draw() {
    //println("DRAW UserSetup");
    background(255);
    String msg="";
    boolean brainDataReceived = collector.isConnected(); //dummy variable should be replaced by call to function that checked if eeg is received
    if (brainDataReceived) {
      msg= "Receiving brain data from " + collector.electrodesConnected + " sensors!";
      cp5.getController("start session").show();
    } else {
      msg+= "Please place headband on subject's head...";
      cp5.getController("start session").hide();
    }
      textAlign(CENTER);

    background(255);
    textSize(25);
    stroke(0); 
    fill(0);
    text(msg, width/2, height/2);
    //ctrl.open();
  }

  void exit() {
    println("USERSETUP exit");
    cp5.hide();
  }

  class MyControlListener implements ControlListener {
    int col;
    public void controlEvent(ControlEvent theEvent) {
      print("the following text was submitted :");
      url1 = cp5.get(Textfield.class, "Subject Forename & Surname").getText();
      url2 = cp5.get(Textfield.class, "Memory description").getText();
      print(" textInput 1 = " + url1);
      print(" textInput 2 = " + url2);
      
      state.currentScreen++;
      println("state now", state.currentScreen);
    }
  }
}