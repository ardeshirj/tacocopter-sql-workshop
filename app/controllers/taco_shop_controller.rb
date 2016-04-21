# TacoShop controller
class TacoShopController < ApplicationController
  def index
    @tacos = Taco.all
    @salsas = Salsa.all
    @store = Store.new
  end

  def search
    @store = Store.new(store_params)
    if @store.valid?
      stores_id = find_stores(@store)
      @stores = Store.includes(:city).where(id: stores_id.map(&:id))
      render 'search'
    else
      render 'index'
    end
  end

  private

  def store_params
    params.require(:store).permit(taco_ids: [], salsa_ids: [])
  end

  def find_stores(store)
    Store.joins(:tacos, :salsas).where(
      tacos: { id: store.taco_ids },
      salsas: { id: store.salsa_ids }
    ).select(
      'stores.id, count(tacos.id), count(salsas.id)'
    ).group(
      'stores.id'
    ).having(
      'count(tacos.id) >= ? AND count(salsas.id) >= ?',
      store.taco_ids.count,
      store.salsa_ids.count
    ).uniq!
  end
end
