module Api
  class TestsController < ApplicationController
    before_action :get_deck

    def index
      @tests = @deck.tests
      render json: @tests
    end

    def show
      @test = @deck.test(params[:test_id]).includes(:responses)
      render :show
    end

    def create
      @responses = @deck.test.new.responses.new(response_params)
      if @responses.save
        render :show
      else
        render json: responses.errors.messages, status: 422
      end
    end

    def response_params
      params.require(:responses).permit([:response_text, :card_id])
    end
  end
end
