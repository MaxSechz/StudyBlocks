module Api
  class SchoolsController < ApplicationController

    def index
      if params[:query]
        @schools = School.search(params[:query]).to_a
      else
        @schools = School.all
      end
      render json: @schools
    end

    def show
      @school = current_user.school.includes(:courses);
    end

    def create
      @school = School.new(school_params)
      @user = @school.users.new(user_params)

      if @school.save
        login!(@user)
        redirect_to root_url
      else
        render "users/new"
      end
    end

    private

    def school_params
      params.require(:school).permit(:name, :country, :state, :city)
    end
  end
end
