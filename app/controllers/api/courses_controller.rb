module Api
  class CoursesController < ApplicationController
    before_action :require_logged_in

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
      @course = current_user.school.courses.new(course_params)
      @course.registrations.new(user_id: current_user.id)

      if @course.save
        render json: @course
      else
        render json: @course.errors.messages
      end
    end

    private

    def course_params
      params.require(:course).permit(:title, :course_code, :instructor, :school_id)
    end
  end
end
