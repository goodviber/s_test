require 'spec_helper'

RSpec.describe Insurer do
  subject { Insurer.new("insurer_a", ["windows", "contents"]) }

  it "should have a name" do
    expect(subject.name).to eq('insurer_a')
  end

  it "should have insurance covers" do
    expect(subject.insurance_covers).to eq(["windows", "contents"])
  end
end
