module Api
  class RegistrationsController < ApplicationController

    def show
      @registration = Registration.find_by(
                      course_id: params[:id],
                      user_id: current_user.id
                      )
      render json: @registration
    end

    def create
      @registration = current_user.registrations.new(registration_params)
      if @registration.save
        render json: @registration
      else
        render json: @registration.errors.messages
      end
    end

    def destroy
      @registration = Registration.find(params[:id])
      @registration.destroy
      render json: @registration
    end

    private

    def registration_params
      params.require(:registration).permit(:course_id)
    end
  end
end
