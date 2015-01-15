module Api
  class CoursesController < ApplicationController

    def index
      if params[:query]
        @courses = current_user.school.courses.search(params[:query]).to_a;
      else
        @courses = current_user.courses
      end
      render json: @courses
    end

    def show
      @course = Course.includes(decks: :user).find(params[:id])
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
end
