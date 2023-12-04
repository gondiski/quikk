require 'rails_helper'

RSpec.describe "Api::V1::Transactions", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/api/v1/transactions/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/transactions/create"
      expect(response).to have_http_status(:success)
    end
  end

end
