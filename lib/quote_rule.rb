class QuoteRule
  attr_reader :type, :block

  TYPE = {match: 1,  multi_match: 2}

  def initialize(type, &block)
    @type = type
    @block = block
  end

  def apply(*args)
    case block.arity
    when 0
      block.call
    when 1
      block.call(args[0])
    when 2
      block.call(args[0], args[1])
    end
  end

end
