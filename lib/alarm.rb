require 'sensor'

class Alarm

  def initialize(sensor)
    @threshold = (17..21)
    @sensor = sensor
  end

  def on?
    @threshold.include?(psi_pressure_value) == false
  end

  private

  def psi_pressure_value
    @sensor.pop_next_pressure_psi_value
  end
end

