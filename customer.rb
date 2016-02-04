class Customer < Person
  def initialize(name = "anonymous")
    super # Call the initialize(name) method in the super class (Person)
    @beers_had = []
    @amount_drank = 0
  end

  def what_is_your_name
    if drunk?
      say "Hic!"
    else
      super
    end
  end

  def drunk?
    @amount_drank > 2000
  end

  def take_beer(beer)
    if has_beer?
      say "I still have beer!"
    else
      say "Cheers!"
      @beers_had << beer
    end
  end

  def drink!
    if has_beer?
      amount_before = current_beer.amount
      current_beer.sip!
      amount_after = current_beer.amount
      @amount_drank += amount_before - amount_after
    else
      say "Oh no! Hit me again!"
    end
  end

  def has_beer?
    current_beer && current_beer.amount > 0
  end

  def current_beer
    @beers_had.last
  end
end
