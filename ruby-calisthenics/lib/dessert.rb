class Dessert
  attr_accessor :calories, :name
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  def healthy?
    @calories < 200 ? true : false
  end
  def delicious?
    true
  end
end

class JellyBean < Dessert
  attr_accessor :flavor
  def initialize(flavor)
    @flavor = flavor
    @calories = 5
    @name = @flavor + " jelly bean"
  end

  def delicious?
    @flavor != "licorice" ? true : false
  end
end

