class Insurer
  attr_reader :name, :insurance_covers

  def initialize(name, insurance_covers=[])
    @name = name
    @insurance_covers = insurance_covers
  end

end
