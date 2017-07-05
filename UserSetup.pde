import controlP5.*;

class UserSetup implements StateInterface {
  ControlP5 cp5;
  ControlGroup ctrl;
  MyControlListener myListener;
  PFont pfont;
  ControlFont font;

  UserSetup(PApplet p, State _state) {
    pfont = createFont("Arial", 20, true); // use true/false for smooth/no-smooth
    font = new ControlFont(pfont, 15);
    cp5 = new ControlP5(p);
    state = _state;

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
    
    if (!collector.isConnectedToMuse() && !DEBUG) {
      state.returnToStart(); // if connection is lost go back to 1st screen
    }
    
    String nameMsg = "enter subject's full name ";
    String memoryMsg = "enter memory ";
    String headbandMsg = "place headband on subject's head";

    boolean noName = (cp5.get(Textfield.class, "Subject's full name").getText().length() < 5);
    boolean noMemory = (cp5.get(Textfield.class, "Memory description").getText().length() < 10);
    boolean brainDataReceived = collector.isConnectedToBrain();

    pushMatrix();
    translate(width/2, 0);
    textAlign(CENTER, CENTER);
    background(255);
    int textSize = 45;
    textSize(textSize); 
    fill(0);
            
    int textOffset = width / 2 - 400;

    if (noName) fill(0); 
    else fill(125);
    text(nameMsg, 0, textOffset);
    if (!noName) line(-textWidth(nameMsg)/2, textOffset + 10, textWidth(nameMsg)/2 - 5, textOffset + 10);

    textOffset += 80;
    if (noMemory) fill(0); 
    else fill(125);
    text(memoryMsg, 0, textOffset);
    if (!noMemory) line(-textWidth(memoryMsg)/2, textOffset + 10, textWidth(memoryMsg)/2 - 5, textOffset + 10);    
  
    textOffset += 80;
    if (!brainDataReceived) fill(0); 
    else fill(125);
    text(headbandMsg, 0, textOffset);
    if (brainDataReceived) line(-textWidth(headbandMsg)/2, textOffset + 10, textWidth(headbandMsg)/2 - 5, textOffset + 10);

    textOffset += 150;

    String readyMsg = "Receiving brain data from " + collector.electrodesConnected + " sensors";
    if (collector.isConnectedToBrain()) {
      fill(color(100,255,100));
    } else {
      fill(color(255,100,100));      
    }
    text(readyMsg, 0, textOffset);
      
    if (brainDataReceived && !noName && !noMemory) {      
      cp5.getController("start session").show();
    } else {
      cp5.getController("start session").hide();
    }

    popMatrix();
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