import java.util.Calendar;

class DataHandler {
  Table data;

  DataHandler() {
    data = new Table();
    data.addColumn("id");
    data.addColumn("valence");
    data.addColumn("activation");
    data.addColumn("accX");
    data.addColumn("accY");
    data.addColumn("accZ");
    data.addColumn("electrode0");
    data.addColumn("electrode1");
    data.addColumn("electrode2");
    data.addColumn("electrode3");
    data.addColumn("alpha_relative0");
    data.addColumn("alpha_relative1");
    data.addColumn("alpha_relative2");
    data.addColumn("alpha_relative3");
    data.addColumn("beta_relative0");
    data.addColumn("beta_relative1");
    data.addColumn("beta_relative2");
    data.addColumn("beta_relative3");
    data.addColumn("gamma_relative0");
    data.addColumn("gamma_relative1");
    data.addColumn("gamma_relative2");
    data.addColumn("gamma_relative3");
    data.addColumn("delta_relative0");
    data.addColumn("delta_relative1");
    data.addColumn("delta_relative2");
    data.addColumn("delta_relative3");
    data.addColumn("theta_relative0");
    data.addColumn("theta_relative1");
    data.addColumn("theta_relative2");
    data.addColumn("theta_relative3");

    data.addColumn("alpha_absolute0");
    data.addColumn("alpha_absolute1");
    data.addColumn("alpha_absolute2");
    data.addColumn("alpha_absolute3");
    data.addColumn("beta_absolute0");
    data.addColumn("beta_absolute1");
    data.addColumn("beta_absolute2");
    data.addColumn("beta_absolute3");
    data.addColumn("gamma_absolute0");
    data.addColumn("gamma_absolute1");
    data.addColumn("gamma_absolute2");
    data.addColumn("gamma_absolute3");
    data.addColumn("delta_absolute0");
    data.addColumn("delta_absolute1");
    data.addColumn("delta_absolute2");
    data.addColumn("delta_absolute3");
    data.addColumn("theta_absolute0");
    data.addColumn("theta_absolute1");
    data.addColumn("theta_absolute2");
    data.addColumn("theta_absolute3");
  }

  void addData(int time, EEGData eegData) {
    TableRow row = data.addRow();
    row.setInt("id", time);
    row.setFloat("valence", eegData.valence);
    row.setFloat("activation", eegData.activation);
    row.setFloat("accX", eegData.accX);
    row.setFloat("accY", eegData.accY);
    row.setFloat("accZ", eegData.accZ);
    row.setFloat("electrode0", eegData.electrodes.get(0));
    row.setFloat("electrode1", eegData.electrodes.get(1));
    row.setFloat("electrode2", eegData.electrodes.get(2));
    row.setFloat("electrode3", eegData.electrodes.get(3));

    row.setFloat("alpha_relative0", eegData.alpha_relative.get(0));
    row.setFloat("alpha_relative1", eegData.alpha_relative.get(1));
    row.setFloat("alpha_relative2", eegData.alpha_relative.get(2));
    row.setFloat("alpha_relative3", eegData.alpha_relative.get(3));
    row.setFloat("beta_relative0", eegData.beta_relative.get(0));
    row.setFloat("beta_relative1", eegData.beta_relative.get(1));
    row.setFloat("beta_relative2", eegData.beta_relative.get(2));
    row.setFloat("beta_relative3", eegData.beta_relative.get(3));
    row.setFloat("gamma_relative0", eegData.gamma_relative.get(0));
    row.setFloat("gamma_relative1", eegData.gamma_relative.get(1));
    row.setFloat("gamma_relative2", eegData.gamma_relative.get(2));
    row.setFloat("gamma_relative3", eegData.gamma_relative.get(3));
    row.setFloat("delta_relative0", eegData.delta_relative.get(0));
    row.setFloat("delta_relative1", eegData.delta_relative.get(1));
    row.setFloat("delta_relative2", eegData.delta_relative.get(2));
    row.setFloat("delta_relative3", eegData.alpha_relative.get(3));
    row.setFloat("theta_relative0", eegData.theta_relative.get(0));
    row.setFloat("theta_relative1", eegData.theta_relative.get(1));
    row.setFloat("theta_relative2", eegData.theta_relative.get(2));
    row.setFloat("theta_relative3", eegData.theta_relative.get(3));

    row.setFloat("alpha_absolute0", eegData.alpha_absolute.get(0));
    row.setFloat("alpha_absolute1", eegData.alpha_absolute.get(1));
    row.setFloat("alpha_absolute2", eegData.alpha_absolute.get(2));
    row.setFloat("alpha_absolute3", eegData.alpha_absolute.get(3));
    row.setFloat("beta_absolute0", eegData.beta_absolute.get(0));
    row.setFloat("beta_absolute1", eegData.beta_absolute.get(1));
    row.setFloat("beta_absolute2", eegData.beta_absolute.get(2));
    row.setFloat("beta_absolute3", eegData.beta_absolute.get(3));
    row.setFloat("gamma_absolute0", eegData.gamma_absolute.get(0));
    row.setFloat("gamma_absolute1", eegData.gamma_absolute.get(1));
    row.setFloat("gamma_absolute2", eegData.gamma_absolute.get(2));
    row.setFloat("gamma_absolute3", eegData.gamma_absolute.get(3));
    row.setFloat("delta_absolute0", eegData.delta_absolute.get(0));
    row.setFloat("delta_absolute1", eegData.delta_absolute.get(1));
    row.setFloat("delta_absolute2", eegData.delta_absolute.get(2));
    row.setFloat("delta_absolute3", eegData.alpha_absolute.get(3));
    row.setFloat("theta_absolute0", eegData.theta_absolute.get(0));
    row.setFloat("theta_absolute1", eegData.theta_absolute.get(1));
    row.setFloat("theta_absolute2", eegData.theta_absolute.get(2));
    row.setFloat("theta_absolute3", eegData.theta_absolute.get(3));
  }

  void saveData(String filename) {
    saveTable(data, filename);
  }
}

String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}