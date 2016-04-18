# Salsa model
class Salsa < ActiveRecord::Base
  has_many :stores_salsas
  has_many :stores, through: :stores_salsas
end
