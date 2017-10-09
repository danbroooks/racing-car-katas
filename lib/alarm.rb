require 'sensor'

class Alarm

  attr_reader :is_alarm_on

  def initialize(sensor)
    @threshold = (17..21)
    @sensor = sensor
    @is_alarm_on = false
  end

  def check
    unless @threshold.include?(psi_pressure_value)
      @is_alarm_on = true
    end
  end

  private

  def psi_pressure_value
    @sensor.pop_next_pressure_psi_value
  end
end

