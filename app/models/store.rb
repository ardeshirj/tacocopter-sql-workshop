# Store model
class Store < ActiveRecord::Base
  has_many :stores_tacos
  has_many :tacos, through: :stores_tacos

  has_many :stores_salsas
  has_many :salsas, through: :stores_salsas

  belongs_to :city

  validates :tacos, presence: true
  validates_associated :tacos

  validates :salsas, presence: true
  validates_associated :salsas
end
