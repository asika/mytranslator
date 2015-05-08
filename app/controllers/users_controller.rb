class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user, :only => %i[show edit update destroy]

  def index
  end

  def show
  end

  protected

  def get_user
    @user = User.find_by_friendly_id(params[:id])
  end
end
