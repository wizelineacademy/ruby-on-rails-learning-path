# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PokemonsController, type: :controller do
  login_trainer

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a 200 response when a valid session is active' do
      get :index, params: {}, session: valid_session
      expect(response).to have_http_status(200)
    end
  end
  describe 'GET #show' do
    it 'returns a 200 response when a valid session is not active' do
      get :show, params: { id: :pikachu }, session: valid_session
      expect(response).to have_http_status(200)
    end
  end
end
