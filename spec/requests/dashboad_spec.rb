require 'rails_helper'

RSpec.describe "Dashboads", type: :request do
  describe "GET /main" do
    it "returns http success" do
      get "/dashboad/main"
      expect(response).to have_http_status(:success)
    end
  end

end
