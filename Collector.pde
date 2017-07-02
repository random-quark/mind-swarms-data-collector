import oscP5.*;
import java.util.*;

class Collector {
  DataHandler dataHandler = new DataHandler();
  OscP5 oscP5 = new OscP5(this, 8000);
  EEGData eegData = new EEGData();  
  
  int minimumElectrodesConnected = 2;
  float minimumElectrodeStatus = 2;
  int electrodesConnected = 0;
  float electrodesScore = 0;

  private Collector(State _state) {
    state = _state;
  }
  
  public void collect() {
    dataHandler.addData(frameCount, eegData);
  }  
    
  public void stop() {
    dataHandler.saveData(state.participantName);
  }
  
  public int getCurrentStateAsColor() {
    println("score is", eegData.valence);
    return lerpColor(color(0,0,255), color(0,255,0), eegData.valence);    
  }
  
  
  public boolean isConnected() {
    return electrodesConnected >= minimumElectrodesConnected;
  }
  
  private void updateElectrodesConnected(int _electrodesConnected, float score) {
    electrodesConnected = _electrodesConnected;
    electrodesScore = score;
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
      electrodesConnected = 0;
      float score = 0;
      for (int i = 0; i < eegData.electrodes.size(); i++) {
        float electrodeStatus = msg.get(i).floatValue();
        score += electrodeStatus;
        eegData.electrodes.set(i, electrodeStatus);
        if (electrodeStatus > 1) {
          electrodesConnected++;
        }
      }
      updateElectrodesConnected(electrodesConnected, score);
    }
  }
}