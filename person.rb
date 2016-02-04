class Person
  def initialize(name)
    @name = name
  end
​
  def greet(other_person)
    say "Hi, how are ya?"
    other_person.greet_back
  end
​
  def greet_back
    say "Fine"
  end
​
  def what_is_your_name
    say @name
  end
​
  def say(message)
    puts "#{@name}: #{message}!"
  end
end
#this is the person file
