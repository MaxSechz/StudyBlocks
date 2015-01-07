class SchoolsController < ApplicationController

  def index
    @schools = School.all
  end

  def show
    @school = current_user.school
  end

  def create
    @school = School.new(school_params)
    @user = @school.users.new(user_params)

    if @school.save
      login!(@user)
    else
      render "users/new"
    end
  end

  private

  def school_params
    params.require(:school).permit(:country, :state, :city)
  end
end
