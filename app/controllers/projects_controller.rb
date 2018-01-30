class ProjectsController < ApplicationController
  before_action :set_users

  def index
    if @user
      @projects = @user.projects.includes(:photos).
      page(params[:page] || 1).per(params[:count] || 4)
    end
  end

  private

  def set_users
    @user = params[:user_id] ? User.find(params[:user_id]) : current_user
    #set users without current for list of other portfolios
    @users = User.where.not(id: @user.id) if @user
  end
end
