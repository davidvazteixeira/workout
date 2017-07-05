class DashboardController < ApplicationController
  def index
    @users = User.paginate(page: params[:page])
  end

  def search
    @users = User.search_by_name(params[:search_name]).paginate(page: params[:page])
  end
end
