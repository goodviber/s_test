class QuoteRule
  attr_reader :type, :block

  TYPE = { two_covers_match: 1,  single_match: 2 }

  def initialize(type, &block)
    @type = type
    @block = block
  end

  def apply(*args)
    block.call(args)
  end

  def self.single_match_rule(insurer)
      QuoteRule.new(QuoteRule::TYPE[:single_match]) do |covers|
        matches = covers[0].keys & insurer.insurance_covers
        sum = 0
        if matches.size == 1
          case covers[0].keys.index(matches[0])
          when 0
            sum = 0.3
          when 1
            sum = 0.25
          when 2
            sum = 0.2
          end
          quote = sum * covers[0][matches[0]]
          print_quote(insurer, quote)
        end
      end
  end

  def self.two_match_rule(insurer)
    QuoteRule.new(QuoteRule::TYPE[:two_covers_match]) do |covers|
      matches = covers[0].keys & insurer.insurance_covers
      sum = 0
      if matches.size == 2
        matches.each do |m|
          sum += covers[0][m]
        end
        quote = sum * 0.1
        print_quote(insurer, quote)
      end
    end
  end

  private

  def self.print_quote(insurer, quote)
    puts "#{insurer.name} : #{quote}" unless quote == 0
  end

end
