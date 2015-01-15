class CoursesController < ApplicationController

  def index
    raise "#{params[:query]}"
    if params[:query]
      @courses = Course.search(params[:query]).to_a;
      raise "#{@courses}"
    else
      @courses = current_user.school.courses
    end
    render :index
  end

  # def search
  #   render :index
  # end

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
