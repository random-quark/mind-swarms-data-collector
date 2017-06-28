import controlP5.*;

class UserSetup implements StateInterface {
  ControlP5 cp5;
  String url1, url2;
  ControlGroup ctrl;

  UserSetup(PApplet p) {
    PFont pfont = createFont("Arial", 20, true); // use true/false for smooth/no-smooth
    ControlFont font = new ControlFont(pfont, 15);
    cp5 = new ControlP5(p);
    ctrl = cp5.addGroup("g1");
    cp5.addTextfield("textInput_1").setPosition(20, 100).setSize(200, 40).setAutoClear(false).setFont(font).moveTo("g1");
    cp5.addTextfield("textInput_2").setPosition(20, 170).setSize(200, 40).setAutoClear(false).setFont(font).moveTo("g1");
    cp5.addBang("Submit").setPosition(240, 170).setSize(80, 40).setFont(font).moveTo("g1");
    
    ctrl.close();
  }

  void setup() {
    println("headplace class setup");
  }

  void draw() {
    println("DRAW UserSetup");
    background(0);
    ctrl.open();
  }

  void Submit() {
    print("the following text was submitted :");
    url1 = cp5.get(Textfield.class, "textInput_1").getText();
    url2 = cp5.get(Textfield.class, "textInput_2").getText();
    print(" textInput 1 = " + url1);
    print(" textInput 2 = " + url2);
    println();
  }
}