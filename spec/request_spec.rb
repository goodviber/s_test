require 'spec_helper'

RSpec.describe Request do
  subject { Request.new('tires', 25) }

  it 'should return correct name' do
    expect(subject.name).to eq('tires')
  end

  it 'should return correct value' do
    expect(subject.value).to eq(25)
  end
end
