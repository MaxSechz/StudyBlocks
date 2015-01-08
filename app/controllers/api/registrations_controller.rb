class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new
    render :new
  end

  def create
    @registration = current_user.registrations.new(registration_params)

    if @registration.save
      redirect_to course_url(@registration.course_id)
    else
      render :new
    end
  end

  def destroy
    @registration = Registration.find_by(course_id: registration_params[:course_id], user_id: current_user.id)
    @registration.destroy
    redirect_to courses_url
  end

  private

  def registration_params
    params.require(:registration).permit(:course_id)
  end
end
