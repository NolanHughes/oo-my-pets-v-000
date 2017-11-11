class Owner
  attr_reader :species
  attr_accessor :name
  attr_writer :pets

  @@all_owners = []

  def initialize(species)
    @species = species
    @@all_owners << self
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.all
    @@all_owners
  end

  def self.reset_all
    self.all.clear
  end

  def self.count
    @@all_owners.count
  end

  def say_species
    "I am a #{@species}."
  end

  def pets
    @pets
  end

  def buy_fish(name)
    new_fish = Fish.new(name)
    @pets[:fishes] += [new_fish]
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    @pets[:cats] += [new_cat]
  end

  def buy_dog(name)
    new_dog = Dog.new(name)
    @pets[:dogs] += [new_dog]
  end

  def walk_dogs
    @pets.each do |key, value|
      if key == :dogs
        value.each { |dog_object| dog_object.mood = "happy" }
      end
    end
  end

  def play_with_cats
    @pets.each do |key, value|
      if key == :cats
        value.each { |cat_object| cat_object.mood = "happy" }
      end
    end
  end

  def feed_fish
    @pets.each do |key, value|
      if key == :fishes
        value.each { |fish_object| fish_object.mood = "happy" }
      end
    end
  end

  def sell_pets
    @pets.each do |key, value|
        value.each { |pets_object| pets_object.mood = "nervous" }
        value.clear
    end
  end

  def list_pets
    @pets.each do |key, value|
        if key == :fishes
          @fish_count = value.count
        elsif key == :dogs
          @dog_count = value.count
        elsif key == :cats
          @cat_count = value.count
        end
    end
    "I have #{@fish_count} fish, #{@dog_count} dog(s), and #{@cat_count} cat(s)."
  end

end
