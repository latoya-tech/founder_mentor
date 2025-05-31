require 'rails_helper'

RSpec.describe "Questions API", type: :request do
  describe "POST /api/ask" do
    it "returns an answer when a question is sent" do
      post "/api/ask",
        params: { question: "What is product-market fit?" }.to_json,
        headers: { "CONTENT_TYPE" => "application/json" }

      binding.pry
      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body)
      expect(json["answer"]).to include("product-market fit")
    end

    it "returns an error when question is missing" do
      post "/api/ask",
        params: {},
        headers: { "CONTENT_TYPE" => "application/json" }

      expect(response).to have_http_status(:bad_request)

      json = JSON.parse(response.body)
      expect(json["error"]).to eq("No question provided")
    end
  end
end
