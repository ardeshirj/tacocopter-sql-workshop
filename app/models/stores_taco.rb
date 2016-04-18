# StoreTaco model
class StoresTaco < ActiveRecord::Base
  belongs_to :store
  belongs_to :taco
end
