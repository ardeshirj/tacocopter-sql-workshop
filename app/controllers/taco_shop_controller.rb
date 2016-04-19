# TachoShop controller
class TacoShopController < ApplicationController
  def index
    @tacos = Taco.all
    @salsas = Salsa.all
  end

  def search
    @selected_tacos = taco_params
    @selected_salsas = salsa_params
  end

  private

  def taco_params
    params.require(:stores_tacos).permit(taco_ids: [])
  end

  def salsa_params
    params.require(:stores_salsas).permit(salsa_ids: [])
  end
end
