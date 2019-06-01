class QuoteManager

  attr_reader :quote_rules

  def initialize(quote_rules=[])
    @quote_rules = quote_rules
  end

  def quote_for(request)
    quote_rules.each do |rule|
      rule.apply(request.trimmed_hash)
    end
  end

end
