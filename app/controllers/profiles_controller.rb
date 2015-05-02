class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user

  def new
    @profile = Profile.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def complete
  end

  protected

  def get_user
  end

  def profile_params
    params.require(:profile).permit(:username, :first_name, :last_name, :phone, :avatar, :short_summary, :bio)
  end
end
