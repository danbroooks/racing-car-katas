require 'alarm'

RSpec.describe Alarm do
  it 'should be turned off by default' do
    expect(subject.is_alarm_on).to be(false)
  end
end
