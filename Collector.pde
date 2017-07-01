import oscP5.*;
import java.util.*;

class Collector {
  Recorder recorder = new Recorder();
  OscP5 oscP5 = new OscP5(this, 8000);
  Map<String, Object> data = new HashMap<String, Object>();

  float AL = 0;
  float AR = 0;
  float valence = 0;
  float activation = 0;
  float accX, accY, accZ;
  FloatList alpha_relative = new FloatList();
  FloatList beta_relative = new FloatList();
  FloatList gamma_relative = new FloatList();
  FloatList delta_relative = new FloatList();
  FloatList theta_relative = new FloatList();
  FloatList alpha_absolute = new FloatList();
  FloatList beta_absolute = new FloatList();
  FloatList gamma_absolute = new FloatList();
  FloatList delta_absolute = new FloatList();
  FloatList theta_absolute = new FloatList();

  float[] electrodes = {
    3.0,
    3.0,
    3.0,
    3.0
  };

  Collector() {
    data.put("AL", 0);
    data.put("AR", 0);
    data.put("valence", 0);
    data.put("activation", 0);
    data.put("accX", 0);
    data.put("accY", 0);
    data.put("accZ", 0);
    data.put("alpha_relative", new FloatList());
    data.put("beta_relative", new FloatList());
    data.put("gamma_relative", new FloatList());
    data.put("delta_relative", new FloatList());
    data.put("theta_relative", new FloatList());
    data.put("alpha_absolute", new FloatList());
    data.put("beta_absolute", new FloatList());
    data.put("gamma_absolute", new FloatList());
    data.put("delta_absolute", new FloatList());
    data.put("theta_absolute", new FloatList());
  }

  public void collect() {
    recorder.addData(frameCount);
  }

  public void drawVisuals() {
  }

  public void stop() {
    recorder.saveData();
  }

  void oscEvent(OscMessage msg) {
    if (msg.checkAddrPattern("/muse/elements/alpha_relative")) {
      alpha_relative[0] = msg.get(0).floatValue();
      alpha_relative[1] = msg.get(1).floatValue();
      alpha_relative[2] = msg.get(2).floatValue();
      alpha_relative[3] = msg.get(3).floatValue();
    }
    if (msg.checkAddrPattern("/muse/elements/beta_relative")) {
      beta_relative[0] = msg.get(0).floatValue();
      beta_relative[1] = msg.get(1).floatValue();
      beta_relative[2] = msg.get(2).floatValue();
      beta_relative[3] = msg.get(3).floatValue();
    }
    if (msg.checkAddrPattern("/muse/elements/gamma_relative")) {
      gamma_relative[0] = msg.get(0).floatValue();
      gamma_relative[1] = msg.get(1).floatValue();
      gamma_relative[2] = msg.get(2).floatValue();
      gamma_relative[3] = msg.get(3).floatValue();
    }
    if (msg.checkAddrPattern("/muse/elements/delta_relative")) {
      delta_relative[0] = msg.get(0).floatValue();
      delta_relative[1] = msg.get(1).floatValue();
      delta_relative[2] = msg.get(2).floatValue();
      delta_relative[3] = msg.get(3).floatValue();
    }
    if (msg.checkAddrPattern("/muse/elements/theta_relative")) {
      theta_relative[0] = msg.get(0).floatValue();
      theta_relative[1] = msg.get(1).floatValue();
      theta_relative[2] = msg.get(2).floatValue();
      theta_relative[3] = msg.get(3).floatValue();
    }
    if (msg.checkAddrPattern("/muse/elements/alpha_absolute")) {
      alpha_absolute[0] = msg.get(0).floatValue();
      alpha_absolute[1] = msg.get(1).floatValue();
      alpha_absolute[2] = msg.get(2).floatValue();
      alpha_absolute[3] = msg.get(3).floatValue();

      AL = msg.get(0).floatValue();
      AR = msg.get(3).floatValue();
      valence = ((AL - AR) + 1) * 0.3;
      activation = AL + AR;
    }
    if (msg.checkAddrPattern("/muse/elements/beta_absolute")) {
      beta_absolute[0] = msg.get(0).floatValue();
      beta_absolute[1] = msg.get(1).floatValue();
      beta_absolute[2] = msg.get(2).floatValue();
      beta_absolute[3] = msg.get(3).floatValue();
    }
    if (msg.checkAddrPattern("/muse/elements/gamma_absolute")) {
      gamma_absolute[0] = msg.get(0).floatValue();
      gamma_absolute[1] = msg.get(1).floatValue();
      gamma_absolute[2] = msg.get(2).floatValue();
      gamma_absolute[3] = msg.get(3).floatValue();

      activation += msg.get(0).floatValue() + msg.get(1).floatValue() + msg.get(2).floatValue() + msg.get(3).floatValue();
      activation /= 6;
      activation *= 0.8;
    }
    if (msg.checkAddrPattern("/muse/elements/delta_absolute")) {
      delta_absolute[0] = msg.get(0).floatValue();
      delta_absolute[1] = msg.get(1).floatValue();
      delta_absolute[2] = msg.get(2).floatValue();
      delta_absolute[3] = msg.get(3).floatValue();
    }
    if (msg.checkAddrPattern("/muse/elements/theta_absolute")) {
      theta_absolute[0] = msg.get(0).floatValue();
      theta_absolute[1] = msg.get(1).floatValue();
      theta_absolute[2] = msg.get(2).floatValue();
      theta_absolute[3] = msg.get(3).floatValue();
    }
    if (msg.checkAddrPattern("/muse/acc")) {
      accX = msg.get(0).floatValue();
      accY = msg.get(1).floatValue();
      accZ = msg.get(2).floatValue();
    }

    if (msg.checkAddrPattern("/muse/elements/horseshoe")) {
      for (int i = 0; i < electrodes.length; i++) {
        electrodes[i] = msg.get(i).floatValue();
      }
    }
  }
}