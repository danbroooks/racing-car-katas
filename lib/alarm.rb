require 'sensor'

class Alarm

  attr_reader :is_alarm_on

  def initialize
    @low_pressure_threshold = 17
    @high_pressure_threshold = 21
    @sensor = Sensor.new()
    @is_alarm_on = false
  end

  def check
    if pressure_too_low or pressure_too_high
      @is_alarm_on = true
    end
  end

  private

  def pressure_too_low
    psi_pressure_value < @low_pressure_threshold
  end

  def pressure_too_high
    psi_pressure_value > @high_pressure_threshold
  end

  def psi_pressure_value
    @sensor.pop_next_pressure_psi_value
  end
end

