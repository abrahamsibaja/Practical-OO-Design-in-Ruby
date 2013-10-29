system('clear')
class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(args)
    args = defaults.merge(args)
    @chainring  = args[:chainring]
    @cog        = args[:cog]
    @rim        = args[:rim]
    @tire       = args[:tire]
  end

  def defaults
    {:chainring => 40, :cog => 18}
  end

  def wheel
    @wheel = Wheel.new(rim, tire)
  end

  def ratio
    chainring / cog.to_f
  end

  def diameter
    wheel.diameter
  end

  def gearInches
    ratio * diameter
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

puts Gear.new(:cog => 11, :rim => 26, :tire => 1.5).gearInches

