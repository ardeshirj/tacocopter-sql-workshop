# TachoShop controller
class TacoShopController < ApplicationController
  def index
    @tacos = Taco.all
    @salsas = Salsa.all
  end

  def search
  end
end
