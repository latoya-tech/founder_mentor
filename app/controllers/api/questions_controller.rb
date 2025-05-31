module Api
  class QuestionsController < ApplicationController
    def ask
      question = params[:question]

      if question.present?
        answer = "This is a response to: #{question}"
        render json: { answer: answer }
      else
        render json: { error: "No question provided" }, status: :bad_request
      end
    rescue => e
      Rails.logger.error "Error processing question: #{e.message}"
      render json: { error: e.message }, status: :internal_server_error
    end
  end
end
