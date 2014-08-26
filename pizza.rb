class Pizza
  attr_reader :name, :description, :time_baked
  def initialize(name, description)
    @name = name
    @description = description
    @time_baked = 0
  end
end
