# Taco model
class Taco < ActiveRecord::Base
  has_many :stores_tacos
  has_many :stores, through: :stores_tacos
end
