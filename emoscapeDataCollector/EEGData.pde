  private class EEGData {
    float AL = 0;
    float AR = 0;
    float valence = 0;
    float activation = 0;
    float accX, accY, accZ;
    FloatList alpha_relative = new FloatList(0,0,0,0);
    FloatList beta_relative = new FloatList(0,0,0,0);
    FloatList gamma_relative = new FloatList(0,0,0,0);
    FloatList delta_relative = new FloatList(0,0,0,0);
    FloatList theta_relative = new FloatList(0,0,0,0);
    FloatList alpha_absolute = new FloatList(0,0,0,0);
    FloatList beta_absolute = new FloatList(0,0,0,0);
    FloatList gamma_absolute = new FloatList(0,0,0,0);
    FloatList delta_absolute = new FloatList(0,0,0,0);
    FloatList theta_absolute = new FloatList(0,0,0,0);
    FloatList electrodes = new FloatList(3.0,3.0,3.0,3.0);
  }