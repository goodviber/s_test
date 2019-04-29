class CoverAccumulator
  attr_reader :quote_rules, :quote_manager
  attr_accessor :covers_array

  def initialize(quote_rules=[])
    @quote_manager = QuoteManager.new(quote_rules)
    @quote_rules = quote_rules
    covers_array=[]
  end

  def acummulator(request)
    covers_array << request
  end

  def remove_lowest_requests(covers_array)
    trimmed_array = covers_array.sort{|a,b| a.value <=> b.value}.last(3)
  end

end
