require 'sensor'

class Alarm

  def initialize(sensor, acceptable)
    @sensor = sensor
    @acceptable = acceptable
  end

  def on?
    !off?
  end

  def off?
    @acceptable.include?(psi_pressure_value)
  end

  private

  def psi_pressure_value
    @sensor.pop_next_pressure_psi_value
  end
end

