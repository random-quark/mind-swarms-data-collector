import oscP5.*;
import java.util.*;

class Collector {
  Recorder recorder = new Recorder();
  OscP5 oscP5 = new OscP5(this, 8000);
  //Map<String, Object> data = new HashMap<String, Object>();

  EEGData eegData = new EEGData();

  Collector(State _state) {
    state = _state;
  }

  public void collect() {
    recorder.addData(frameCount, eegData);
  }

  public void drawVisuals() {
  }

  public void stop() {
    recorder.saveData(state.participantName);
  }

  void oscEvent(OscMessage msg) {
    if (msg.checkAddrPattern("/muse/elements/alpha_relative")) {
      eegData.alpha_relative.set(0, msg.get(0).floatValue());
      eegData.alpha_relative.set(1, msg.get(1).floatValue());
      eegData.alpha_relative.set(2, msg.get(2).floatValue());
      eegData.alpha_relative.set(3, msg.get(3).floatValue());
    }
    if (msg.checkAddrPattern("/muse/elements/beta_relative")) {
      eegData.beta_relative.set(0, msg.get(0).floatValue());
      eegData.beta_relative.set(1, msg.get(1).floatValue());
      eegData.beta_relative.set(2, msg.get(2).floatValue());
      eegData.beta_relative.set(3, msg.get(3).floatValue());
    }
    if (msg.checkAddrPattern("/muse/elements/gamma_relative")) {
      eegData.gamma_relative.set(0, msg.get(0).floatValue());
      eegData.gamma_relative.set(1, msg.get(1).floatValue());
      eegData.gamma_relative.set(2, msg.get(2).floatValue());
      eegData.gamma_relative.set(3, msg.get(3).floatValue());
    }
    if (msg.checkAddrPattern("/muse/elements/delta_relative")) {
      eegData.delta_relative.set(0, msg.get(0).floatValue());
      eegData.delta_relative.set(1, msg.get(1).floatValue());
      eegData.delta_relative.set(2, msg.get(2).floatValue());
      eegData.delta_relative.set(3, msg.get(3).floatValue());
    }
    if (msg.checkAddrPattern("/muse/elements/theta_relative")) {
      eegData.theta_relative.set(0, msg.get(0).floatValue());
      eegData.theta_relative.set(1, msg.get(1).floatValue());
      eegData.theta_relative.set(2, msg.get(2).floatValue());
      eegData.theta_relative.set(3, msg.get(3).floatValue());
    }
    if (msg.checkAddrPattern("/muse/elements/alpha_absolute")) {
      eegData.alpha_absolute.set(0, msg.get(0).floatValue());
      eegData.alpha_absolute.set(1, msg.get(1).floatValue());
      eegData.alpha_absolute.set(2, msg.get(2).floatValue());
      eegData.alpha_absolute.set(3, msg.get(3).floatValue());

      eegData.AL = msg.get(0).floatValue();
      eegData.AR = msg.get(3).floatValue();
      eegData.valence = ((eegData.AL - eegData.AR) + 1) * 0.3;
      eegData.activation = eegData.AL + eegData.AR;
    }
    if (msg.checkAddrPattern("/muse/elements/beta_absolute")) {
      eegData.beta_absolute.set(0, msg.get(0).floatValue());
      eegData.beta_absolute.set(1, msg.get(1).floatValue());
      eegData.beta_absolute.set(2, msg.get(2).floatValue());
      eegData.beta_absolute.set(3, msg.get(3).floatValue());
    }
    if (msg.checkAddrPattern("/muse/elements/gamma_absolute")) {
      eegData.gamma_absolute.set(0, msg.get(0).floatValue());
      eegData.gamma_absolute.set(1, msg.get(1).floatValue());
      eegData.gamma_absolute.set(2, msg.get(2).floatValue());
      eegData.gamma_absolute.set(3, msg.get(3).floatValue());

      eegData.activation += msg.get(0).floatValue() + msg.get(1).floatValue() + msg.get(2).floatValue() + msg.get(3).floatValue();
      eegData.activation /= 6;
      eegData.activation *= 0.8;
    }
    if (msg.checkAddrPattern("/muse/elements/delta_absolute")) {
      eegData.delta_absolute.set(0, msg.get(0).floatValue());
      eegData.delta_absolute.set(1, msg.get(1).floatValue());
      eegData.delta_absolute.set(2, msg.get(2).floatValue());
      eegData.delta_absolute.set(3, msg.get(3).floatValue());
    }
    if (msg.checkAddrPattern("/muse/elements/theta_absolute")) {
      eegData.theta_absolute.set(0, msg.get(0).floatValue());
      eegData.theta_absolute.set(1, msg.get(1).floatValue());
      eegData.theta_absolute.set(2, msg.get(2).floatValue());
      eegData.theta_absolute.set(3, msg.get(3).floatValue());
    }
    if (msg.checkAddrPattern("/muse/acc")) {
      eegData.accX = msg.get(0).floatValue();
      eegData.accY = msg.get(1).floatValue();
      eegData.accZ = msg.get(2).floatValue();
    }

    if (msg.checkAddrPattern("/muse/elements/horseshoe")) {
      for (int i = 0; i < eegData.electrodes.size(); i++) {
        eegData.electrodes.set(i, msg.get(i).floatValue());
      }
    }
  }
}