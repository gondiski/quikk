require 'rails_helper'

RSpec.describe "Api::V1::Developers", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/api/v1/developers/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/api/v1/developers/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/v1/developers/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/developers/show"
      expect(response).to have_http_status(:success)
    end
  end

end
