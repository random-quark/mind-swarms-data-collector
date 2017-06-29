import controlP5.*;

class UserSetup implements StateInterface {
  ControlP5 cp5;
  String url1, url2;
  ControlGroup ctrl;
  MyControlListener myListener;

  UserSetup(PApplet p) {
    PFont pfont = createFont("Arial", 20, true); // use true/false for smooth/no-smooth
    ControlFont font = new ControlFont(pfont, 15);
    cp5 = new ControlP5(p);

    ctrl = cp5.addGroup("user").setPosition(300, 100)
      .setWidth(300)
      .activateEvent(true)
      .setBackgroundColor(color(255, 80))
      .setBackgroundHeight(100)
      .setLabel("Hello World.")
      ;
    cp5.addTextfield("Forename, Surname").setPosition(20, 100).setSize(200, 40).setAutoClear(false).setFont(font).moveTo("user");
    cp5.addTextfield("Memory description").setPosition(20, 170).setSize(200, 40).setAutoClear(false).setFont(font).moveTo("user");
    cp5.addBang("submit").setPosition(240, 170).setSize(80, 40).setFont(font).moveTo("user");
    myListener = new MyControlListener();
    cp5.getController("submit").addListener(myListener);
    //ctrl.setOpen(true);
    //ctrl.showBar();
    //ctrl.close();
  }

  void setup() {
    println("userSetup class setup");
  }

  void draw() {
    //println("DRAW UserSetup");
    background(0);
    //ctrl.open();
  }

  class MyControlListener implements ControlListener {
    int col;
    public void controlEvent(ControlEvent theEvent) {
      print("the following text was submitted :");
      url1 = cp5.get(Textfield.class, "Forename, Surname").getText();
      url2 = cp5.get(Textfield.class, "Memory description").getText();
      print(" textInput 1 = " + url1);
      print(" textInput 2 = " + url2);
      println();
      //ctrl.hide();
      //ctrl.setLabel("hello") ;
    }
  }
}