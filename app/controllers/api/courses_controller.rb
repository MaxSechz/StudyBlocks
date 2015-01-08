class CoursesController < ApplicationController

  def index
    @courses = current_user.school.courses
    render :index
  end

  def show
    @course = Course.find(params[:id])
    render :show
  end

  def create
    @course = Course.new(course_params)
    @course.registrations.new(user_id: current_user.id)

    if @course.save
      redirect_to course_url(@course)
    else
      render "registrations/new"
    end
  end

  private

  def course_params
    params.require(:course).permit(:title, :course_code, :instructor, :school_id)
  end
end
