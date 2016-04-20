# TacoShop controller
class TacoShopController < ApplicationController
  def index
    @tacos = Taco.all
    @salsas = Salsa.all
  end

  def search
    p params
    selected_tacos = taco_params
    selected_salsas = salsa_params

    stores_id = find_stores(
      selected_tacos['taco_ids'],
      selected_salsas['salsa_ids']
    )

    @stores = Store.includes(:city).where(id: stores_id.map(&:id))
  end

  private

  def taco_params
    params.require(:stores_tacos).permit(taco_ids: [])
  end

  def salsa_params
    params.require(:stores_salsas).permit(salsa_ids: [])
  end

  def find_stores(taco_ids, salsa_ids)
    Store.joins(:tacos, :salsas).where(
      tacos: { id: taco_ids },
      salsas: { id: salsa_ids }
    ).select(
      'stores.id, count(tacos.id), count(salsas.id)'
    ).group(
      'stores.id'
    ).having(
      'count(tacos.id) >= ? AND count(salsas.id) >= ?',
      taco_ids.count,
      salsa_ids.count
    ).uniq!
  end
end
