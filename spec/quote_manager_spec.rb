require 'spec_helper'

RSpec.describe QuoteManager do
  let(:insurer) { Struct.new(:name, :insurance_covers).new('insurer_a', ['windows', 'contents']) }
  let(:request) { Request.new({"tires" => 10, "windows" => 30, "engine" => 40, "contents" => 60, "doors" => 15})}
  let(:quote_rule) { [QuoteRule.two_match_rule(insurer)] }

  subject { QuoteManager.new(quote_rule) }

  describe '#quote_for' do

    it "should pass the params to the quote_rule" do
      expect(quote_rule[0]).to receive(:apply) { request.trimmed_hash }

      subject.quote_for(request)
    end

  end
end
