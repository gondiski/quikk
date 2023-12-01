require 'rails_helper'
require 'swagger_helper'

RSpec.describe "Api::V1::Topups", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/api/v1/topup/new"
      expect(response).to have_http_status(:success)
    end
  end

end
