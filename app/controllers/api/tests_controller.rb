module Api
  class TestsController < ApplicationController
    before_action :get_deck

    def index
      @tests = @deck.tests
      render :index
    end

    def show
      @test = @deck.test(params[:test_id]).includes(:responses)
      render :show
    end

    def create
      @test = @deck.tests.new(test_params)
      if @test.save
        render :show
      else
        render json: @test.errors.messages, status: 422
      end
    end

    def test_params
      params.require(:test).permit(responses_attributes: [:id, :response_text, :card_id])
    end
  end
end
