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
      stores_id = find_stores
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

  def find_stores
    Store.joins(:tacos, :salsas).where(
      tacos: { id: @store.taco_ids },
      salsas: { id: @store.salsa_ids }
    ).select(
      'stores.id,
      count(distinct tacos.id) AS taco_count,
      count(distinct salsas.id) AS salsa_count'
    ).group(
      'stores.id'
    ).having(
      'count(distinct tacos.id) >= ? AND
      count(distinct salsas.id) >= ?',
      @store.taco_ids.count,
      @store.salsa_ids.count
    ).uniq!
  end
end
