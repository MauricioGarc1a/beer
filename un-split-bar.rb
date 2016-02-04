class Beer
  # We ONLY want to be able to read @amount, not
  # change it without calling "sip!"
  attr_reader :amount

  def initialize
    @amount = 250
  end

  def sip!
    if @amount > 0
      puts "Slorp!"
      @amount -= 25
    end
  end
end

class Person
  def initialize(name)
    @name = name
  end

  def greet(other_person)
    say "Hi, how are ya?"
    other_person.greet_back
  end

  def greet_back
    say "Fine"
  end

  def what_is_your_name
    say @name
  end

  def say(message)
    puts "#{@name}: #{message}!"
  end
end

class Bartender < Person
  def initialize(name)
    super # Call the initialize(name) method in the super class (Person)
    @customers = []
  end

  def greet(customer)
    super
    @customers << customer
  end

  def serve(customer)
    say "There ya go.."
    customer.take_beer(Beer.new)
  end
end

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

the_bartender = Bartender.new("Joe")
captain_jack = Customer.new("Cpt. Jack")

the_bartender.greet(captain_jack)
the_bartender.serve(captain_jack)

# Captain Jack can drink while he has beer
while captain_jack.has_beer?
  captain_jack.drink!
  sleep 1
end

captain_jack.drink!
the_bartender.serve(captain_jack)
