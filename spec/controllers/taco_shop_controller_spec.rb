require 'rails_helper'

RSpec.describe TacoShopController, type: :controller do
  describe 'GET index' do
    it 'assigns new store' do
      get :index
      expect(assigns(:store)).to be_a_new(Store)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET search' do
    it 'should return the stores' do
      expected = [1, 4, 6, 7, 12]
      get :search, store: { taco_ids: [1, 3], salsa_ids: [1] }
      expect(response).to have_http_status(:ok)
      expect(response).to render_template('search')
      expect(assigns(:stores).map(&:id)).to eq(expected)
    end

    it 'should return invalid store' do
      get :search, store: { taco_ids: [1, 3] }
      expect(response).to have_http_status(:ok)
      expect(response).to render_template('index')
      expect(assigns(:store)).to_not be_valid
    end
  end
end
