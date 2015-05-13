class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user, :only => %i[show edit update destroy]

  def index
  end

  def show
  end

  def edit
    @profile = current_user.profile || Profile.new
  end

  def update
    @profile = current_user.profile || current_user.build_profile

    @profile.attributes = profile_params

    if @profile.save
      #if params[:next] == "complete"
        #redirect_to complete_user_profile_url(current_user)
      #else
        redirect_to edit2_user_profile_url(current_user)
      #end
    else
      render :action => :edit
    end
  end

  def edit2
    @profile = current_user.profile
    #@profile.save
    #redirect_to complete_user_profile_url(current_user)
  end

  protected

  def get_user
    @user = User.find_by_username(params[:id])
  end
end
