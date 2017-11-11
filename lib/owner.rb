# require 'pry'
# require_relative 'dog.rb'
class Owner
  attr_reader :species
  attr_accessor :name

  @@all_owners = []

  def initialize(species)
    @species = species
    @@all_owners << self
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

  @@pet_hash = {:fishes => [], :dogs => [], :cats => []}

  def pets
    @@pet_hash
  end

  def buy_fish(name)
    new_fish = Fish.new(name)
    @@pet_hash[:fishes] = [new_fish]
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    @@pet_hash[:cats] = [new_cat]
  end

  def buy_dog(name)
    new_dog = Dog.new(name)
    @@pet_hash[:dogs] = [new_dog]
  end

  def walk_dogs
    @@pet_hash.each do |key, value|
      if key == :dogs
        value.each { |dog_object| dog_object.mood = "happy" }
      end
    end
  end

  def play_with_cats
    @@pet_hash.each do |key, value|
      if key == :cats
        value.each { |cat_object| cat_object.mood = "happy" }
      end
    end
  end

  def feed_fish
    @@pet_hash.each do |key, value|
      if key == :fish
        value.each { |fish_object| fish_object.mood = "happy" }
      end
    end
  end

end
