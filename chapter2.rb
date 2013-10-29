system('clear')
module SomeFramework
  class Gear
    attr_reader :chainring, :cog, :rim, :tire
    def initialize(chainring, cog, rim, tire)
      @chainring  = chainring
      @cog        = cog
      @rim        = rim
      @tire       = tire
    end

    def wheel
      @wheel = SomeFramework::Wheel.new(rim, tire)
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
end

module GearWrapper
  def self.gear(args)
    SomeFramework::Gear.new(args[:chainring],
                           args[:cog],
                           args[:rim],
                           args[:tire])
  end
end

module SomeFramework
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
end

puts GearWrapper.gear(
  :chainring => 52,
  :cog       => 11,
  :rim       => 20,
  :tire      => 1.5).gearInches
