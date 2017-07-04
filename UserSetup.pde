import controlP5.*;

class UserSetup implements StateInterface {
  ControlP5 cp5;
  //String url1, url2;
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
    cp5.addTextfield("Subject's full name").setPosition(20, 20).setSize(400, 40).setAutoClear(false).setFont(font).setColorValue(0);
    cp5.addTextfield("Memory description").setPosition(20, 90).setSize(400, 40).setAutoClear(false).setFont(font).setColorValue(0);
    cp5.addBang("start session").setPosition(width/2-120/2, height/2 + 180).setSize(120, 40).setFont(font).hide();
    myListener = new MyControlListener();
    cp5.getController("start session").addListener(myListener);
  }

  void draw() {
    background(255);
    
    if (!collector.isConnectedToMuse()) {
      state.currentScreen=0; // if connection is lost go back to 1st screen
    }
    
    String msg = "Please:";
    String nameMsg = "enter subject's full name ";
    String memoryMsg = "enter memory ";
    String headbandMsg = "place headband on subject's head";

    boolean noName = (cp5.get(Textfield.class, "Subject's full name").getText().length() < 5);
    boolean noMemory = (cp5.get(Textfield.class, "Memory description").getText().length() < 10);
    boolean brainDataReceived = collector.isConnectedToBrain();

    //if (noName || noMemory) msg += "Please: ";


    //if (!brainDataReceived) msg+= "\nPlace headband on subject's head";

    pushMatrix();
    translate(width/2, height/2-30);
    textAlign(CENTER);
    background(255);
    textSize(25); 
    fill(0);
    text(msg, 0, 0);

    if (noName) fill(0); 
    else fill(125);
    text(nameMsg, 0, 30);
    if (!noName) line(- textWidth(nameMsg)/2, 23, textWidth(nameMsg)/2 - 5, 23);

    if (noMemory) fill(0); 
    else fill(125);
    text(memoryMsg, 0, 0 + 60);
    if (!noMemory) line(- textWidth(memoryMsg)/2, 53, textWidth(memoryMsg)/2 - 5, 53);    

    if (!brainDataReceived) fill(0); 
    else fill(125);
    text(headbandMsg, 0, 90);
    if (brainDataReceived) line(- textWidth(headbandMsg)/2, 83, textWidth(headbandMsg)/2 - 5, 83);

    if (brainDataReceived && !noName && !noMemory) {
      String readyMsg = "Receiving brain data from " + collector.electrodesConnected + " sensors";
      fill(0);
      text(readyMsg, 0, 200);
      cp5.getController("start session").show();
    } else {
      cp5.getController("start session").hide();
    }

    popMatrix();
    //link("http://www.google.com");
  }

  void exit() {
    cp5.hide();
  }

  class MyControlListener implements ControlListener {
    public void controlEvent(ControlEvent theEvent) {
      state.participantName = cp5.get(Textfield.class, "Subject's full name").getText();
      state.participantMemory = cp5.get(Textfield.class, "Memory description").getText();
      state.filename = "data/" + state.participantName + "_" + timestamp() + ".csv";

      state.currentScreen++;
    }
  }
}