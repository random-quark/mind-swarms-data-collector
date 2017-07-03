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
    cp5.addTextfield("Subject Forename & Surname").setPosition(20, 20).setSize(400, 40).setAutoClear(false).setFont(font).setColorValue(0);
    cp5.addTextfield("Memory description").setPosition(20, 90).setSize(400, 40).setAutoClear(false).setFont(font).setColorValue(0);
    cp5.addBang("start session").setPosition(width/2-120/2, height/2 + 30).setSize(120, 40).setFont(font).hide();
    myListener = new MyControlListener();
    cp5.getController("start session").addListener(myListener);
  }

  void draw() {
    background(255);
    String msg = " ";

    boolean noName = (cp5.get(Textfield.class, "Subject Forename & Surname").getText().length() == 0);
    boolean noMemory = (cp5.get(Textfield.class, "Memory description").getText().length() == 0);

    if (noName || noMemory) msg += "Please provide ";
    if (noName) msg += "subject's name ";
    if (noName && noMemory) msg += "& ";
    if (noMemory) msg += "memory ";

    boolean brainDataReceived = collector.isConnectedToBrain();
    if (!brainDataReceived) msg+= "\nPlace headband on subject's head";

    if (brainDataReceived && !noName && !noMemory) {
      msg = "Receiving brain data from " + collector.electrodesConnected + " sensors";
      cp5.getController("start session").show();
    } else {
      cp5.getController("start session").hide();
    }
    textAlign(CENTER);

    background(255);
    textSize(25);
    stroke(0); 
    fill(0);
    text(msg, width/2, height/2);
  }

  void exit() {
    cp5.hide();
  }

  class MyControlListener implements ControlListener {
    public void controlEvent(ControlEvent theEvent) {
      state.participantName = cp5.get(Textfield.class, "Subject Forename & Surname").getText();
      state.participantMemory = cp5.get(Textfield.class, "Memory description").getText();
      state.filename = "data/" + state.participantName + "_" + timestamp() + ".csv";

      state.currentScreen++;
    }
  }
}