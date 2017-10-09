class Sensor
  OFFSET = 16

  def pop_next_pressure_psi_value
    OFFSET + Sensor.sample_pressure()
  end

  def self.sample_pressure
    # placeholder implementation that simulate a real sensor in a real tire
    6 * rand * rand
  end
end

