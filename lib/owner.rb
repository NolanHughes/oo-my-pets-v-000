require 'pry'
# require_relative 'fish.rb'
# require_relative 'dog.rb'
# require_relative 'cat.rb'
class Owner
  attr_reader :species
  attr_accessor :name
  attr_writer :pets

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
    @@pet_hash[:fishes] += [new_fish]
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    @@pet_hash[:cats] += [new_cat]
  end

  def buy_dog(name)
    new_dog = Dog.new(name)
    @@pet_hash[:dogs] += [new_dog]
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
      if key == :fishes
        value.each { |fish_object| fish_object.mood = "happy" }
      end
    end
  end

  def sell_pets
    @@pet_hash.each do |key, value|
        value.each { |pets_object| pets_object.mood = "nervous" }
        value.clear
    end
  end

  def list_pets
    @@pet_hash.each do |key, value|
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

owner = Owner.new("human")
# fido = Dog.new("Fido")
# tabby = Cat.new("Tabby")
# nemo = Fish.new("Nemo")
# melkor = Cat.new("Melkor")
# [fido, tabby, nemo, melkor].each {|o| o.mood = "happy" }
# owner.pets[:dogs] += [fido]
# owner.pets[:cats] += [tabby, melkor]
# owner.pets[:fishes] += [nemo]

# owner.buy_fish("Bubbles")
# owner.buy_fish("Nemo")
# owner.buy_cat("Crookshanks")
# owner.buy_dog("Fido")
# owner.buy_dog("Snuffles")
# owner.buy_dog("Charley")
# #
# binding.pry
#
# @pet_hash = {:fishes => ["fish1"], :dogs => ["dog1", "dog2", "dog3"], :cats => ["cat1", "cat2", "cat3", "cat4"]}
# @pet_hash.each do |key, value|
#     if key == :fishes
#       @fish_count = value.count
#     elsif key == :dogs
#       @dog_count = value.count
#     elsif key == :cats
#       @cat_count = value.count
#     end
# end
