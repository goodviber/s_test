require 'spec_helper'

RSpec.describe QuoteRule do
  subject { QuoteRule.new(QuoteRule::TYPE[:two_covers_match]) }

  describe '#type' do
    it 'should return type as value' do
      expect(subject.type).to eq(1)
    end
  end

  describe 'two_match_rule method' do
    context 'with 2 matches' do
      let (:insurer_a) { Insurer.new("insurer_a", ["windows", "contents"]) }
      subject { QuoteRule.two_match_rule(insurer_a) }

      it 'should be instance of QuoteRule' do
        expect(subject).to be_a_kind_of(QuoteRule)
      end

      it "should calculate 2 match quote correctly" do
        expect{(subject.apply({ "windows" => 10, "contents" => 20, "engine" => 30 }))}.to output("insurer_a : 3.0\n").to_stdout
      end

      it "should not return a quote if a matched value is 0" do
        expect{(subject.apply({ "windows" => 0, "contents" => 0, "engine" => 30 }))}.to_not output.to_stdout
      end
    end

    context 'with 1 match' do
      let (:insurer_b) { Insurer.new("insurer_b", ["tires", "contents"]) }
      subject { QuoteRule.two_match_rule(insurer_b) }

      it "should not return a quote" do
        expect{(subject.apply({ "windows" => 10, "contents" => 20, "engine" => 30 }))}.to_not output.to_stdout
      end
    end
  end

  describe 'single_match_rule method' do
    context 'with one match' do
      let (:insurer) { Insurer.new("insurer_a", ["windows", "contents"]) }
      subject { QuoteRule.single_match_rule(insurer) }

      it "should be an instance of QuoteRule" do
        expect(subject).to be_a_kind_of(QuoteRule)
      end

      it "should calculate 1 match quote correctly if match is highest" do
        expect{(subject.apply({ "wheels" => 10, "engine" => 20, "contents" => 30 }))}.to output("insurer_a : 6.0\n").to_stdout
      end

      it "should calculate 1 match quote correctly if match is second highest" do
        expect{(subject.apply({ "wheels" => 10, "contents" => 20, "engine" => 30 }))}.to output("insurer_a : 5.0\n").to_stdout
      end

      it "should calculate 1 match quote correctly if match is third highest" do
        expect{(subject.apply({ "contents" => 10, "wheels" => 20, "engine" => 30 }))}.to output("insurer_a : 3.0\n").to_stdout
      end

      it "should not return a quote if matched value is 0" do
        expect{(subject.apply({  "contents" => 0, "windows" => 10, "engine" => 30 }))}.to_not output.to_stdout
      end
    end

    context 'with more than 1 match' do
      let (:insurer) { Insurer.new("insurer_a", ["windows", "contents"]) }
      subject { QuoteRule.single_match_rule(insurer) }

      it "should not return a quote" do
        expect{(subject.apply({ "windows" => 10, "contents" => 20, "engine" => 30 }))}.to_not output.to_stdout
      end

    end
  end

  describe 'creating quote_rule processor' do
    it 'should call block with no arguments' do
      value = false
      quote_rule = QuoteRule.new(QuoteRule::TYPE[:two_covers_match]) do
        value = true
      end
      expect(quote_rule.apply).to be_truthy
    end

    it 'should call block with one argument' do
      quote_rule = QuoteRule.new(QuoteRule::TYPE[:two_covers_match]) do |value|
        value
      end
      expect(quote_rule.apply('foo')).to eq(['foo'])
    end
  end

end
