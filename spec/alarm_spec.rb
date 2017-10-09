require 'alarm'

RSpec.describe Alarm do
  subject {
    Alarm.new(Sensor.new())
  }

  it 'should be turned off by default' do
    expect(subject.is_alarm_on).to be(false)
  end

  it 'should not trigger the alarm when the pressure is in the threshold range' do
    allow(Sensor).to receive(:sample_pressure) { 5 }
    subject.check
    expect(subject.is_alarm_on).to be(false)
  end

  it 'should turn on when pressure is less than threshold range' do
    allow(Sensor).to receive(:sample_pressure) { 0 }
    subject.check
    expect(subject.is_alarm_on).to be(true)
  end

  it 'should turn on when pressure is greater than threshold range' do
    allow(Sensor).to receive(:sample_pressure) { 10 }
    subject.check
    expect(subject.is_alarm_on).to be(true)
  end
end
