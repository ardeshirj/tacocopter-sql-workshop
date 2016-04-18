# StoreSalsa model
class StoresSalsa < ActiveRecord::Base
  belongs_to :store
  belongs_to :salsa
end
