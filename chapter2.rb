system('clear')
class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring  = chainring
    @cog        = cog
    @wheel      = Wheel.new(rim, tire)
  end

  def ratio
    chainring / cog.to_f
  end

  def gearInches
    ratio * @wheel.diameter
  end
end

class Wheel
  attr_reader :rim, :tire
  def initialize (rim, tire)
    @rim = rim
    @tire = tire
  end

  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect {|cell| Wheel.new(cell[0], cell[1])}
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end

end

puts Gear.new(52, 11, 26, 1.5).gearInches

