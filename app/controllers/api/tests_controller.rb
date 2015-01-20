module Api
  class TestsController < ApplicationController
    before_action :require_logged_in
    before_action :get_deck

    def index
      @tests = @deck.tests.where(user_id: current_user.id)
      render :index
    end

    def show
      @test = @deck.tests.includes(responses: :card).find(params[:id])
      render :show
    end

    def create
      @test = @deck.tests.new(test_params)
      @test.user = current_user
      if @test.save
        render :show
      else
        render json: @test.errors.messages, status: 422
      end
    end

    def test_params
      params[:test][:responses_attributes].each do |attr|
        if attr["response_text"].is_a? Array
          attr["response_text"] = attr["response_text"].to_json
        end
      end
      params.require(:test).permit(responses_attributes: [:id, :response_text, :card_id])
    end
  end
end
