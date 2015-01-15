module Api
  class RegistrationsController < ApplicationController
    def new
      @registration = Registration.new
      render :new
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
      @registration = Registration.find_by(course_id: registration_params[:course_id], user_id: current_user.id)
      @registration.destroy
      render json: @registration
    end

    private

    def registration_params
      params.require(:registration).permit(:course_id)
    end
  end
end
