class Gear
  attr_reader :chainring, :cog
  def initialize(chainring, cog)
    @chainring  = chainring
    @cog        = cog
  end

  def ratio
    chainring / cog.to_f
  end
end

puts Gear.new(52, 11).ratio

class RevealingReferences
  attr_reader :wheels
  def initialize (data)
    @wheels = wheelify(data)
  end

  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect {|cell| Wheel.new(cell[0], cell[1])}
  end

  def diameters
    wheels.collect {|wheel| wheel.rim + (wheel.tire * 2)}
  end
end

puts RevealingReferences.new([[30,15],[10,10]]).diameters
