require 'alarm'

RSpec.describe Alarm do
  subject {
    Alarm.new(Sensor.new(), 17..21)
  }

  it 'should not trigger the alarm when the pressure is in the threshold range' do
    allow(Sensor).to receive(:sample_pressure) { 5 }
    expect(subject).to be_off
  end

  it 'should turn on when pressure is less than threshold range' do
    allow(Sensor).to receive(:sample_pressure) { 0 }
    expect(subject).to be_on
  end

  it 'should turn on when pressure is greater than threshold range' do
    allow(Sensor).to receive(:sample_pressure) { 10 }
    expect(subject).to be_on
  end
end
