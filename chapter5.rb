class Trip
  attr_reader :bicybles, :customers, :vehicle

  def prepare (mechanic)
    mechanic.prepare_bicycles (bicycles)
  end
end

class Mechanic
  def prepare_bicycles (bicycle)

  end
end
