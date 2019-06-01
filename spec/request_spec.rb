require 'spec_helper'

RSpec.describe Request do
  subject { Request.new('tires' => 25) }

  it 'should have correct keys' do
    expect(subject.covers.keys[0]).to eq('tires')
  end

  it 'should have correct values' do
    expect(subject.covers.values[0]).to eq(25)
  end
end
