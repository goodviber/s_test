class Request
  attr_reader :covers

  def initialize(covers = {})
    @covers = covers
  end

  def trimmed_hash
    sorted_hash = @covers.sort_by{|k,v| v}.to_h
    sorted_hash.map{|h| h}[-3..-1].to_h
  end

end
