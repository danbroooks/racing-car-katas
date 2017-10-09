require 'alarm'

RSpec.describe Alarm do
  it 'should be turned off by default' do
    expect(subject.is_alarm_on).to be(false)
  end

  it 'should turn on when pressure is not within threshold range' do
    subject.check
    expect(subject.is_alarm_on).to be(true)
  end

end
