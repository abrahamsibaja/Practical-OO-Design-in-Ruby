class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring  = chainring
    @cog        = cog
    @rim        = rim
    @tire       = tire
  end

  def gearInches
    ratio * (rim + (2 * tire))
  end

  def ratio
    chainring / cog.to_f
  end
end

puts Gear.new(52, 11, 24, 1.25).gearInches
