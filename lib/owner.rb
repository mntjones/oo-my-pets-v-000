class Owner
  attr_accessor :pets, :name
  attr_reader :species
  @@all = []
  @@count = 0
  
  def initialize(species)
    @species = species
    @pets = {:fishes => [], :cats => [], :dogs => []}
    save
  end
  
  def save
    @@all << self
    @@count += 1
  end
  
  def self.all
    @@all
  end
  
  def self.reset_all
    @@all = []
    @@count
  end
  
  def self.count
    @@count
  end
  
  def say_species
    "I am a #{self.species}."
  end
  
  def buy_fish(name)
    new_fish = Fish.new(name)
    @pets[:fishes] << new_fish
  end
  
  def buy_cat(name)
    new_cat = Cat.new(name)
    @pets[:cats] << new_cat
  end
  
  def buy_dog(name)
    new_dog = Dog.new(name)
    @pets[:dogs] << new_dog
  end
  
  def feed_fish
    @pets[:fishes].collect do |fish|
      fish.mood = "happy"
    end
  end
  
  def play_with_cats
    @pets[:cats].collect do |cat|
      cat.mood = "happy"
    end
  end
  
  def walk_dogs
    @pets[:dogs].collect do |dog|
      dog.mood = "happy"
    end
  end
  
  def sell_pets
    @pets[:dogs].collect do |dog|
      dog.mood= "nervous"
    end
    
    @pets[:cats].collect do |cat|
      cat.mood= "nervous"
    end
    
    @pets[:fishes].collect do |fish|
      fish.mood= "nervous"
    end
    
    @pets = {:fishes => [], :cats => [], :dogs => []}
  end
  
  def list_pets
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end
end