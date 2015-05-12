class ProfilesController < ApplicationController

  before_action :authenticate_user!, :except => %i[index show]
  before_action :get_user, :only => %i[show edit update destroy]

  def index
    @q = Profile.all

    if params[:lang]
      @q = @q.joins(:languages).where( "languages.id" => params[:lang] )
    end

    if params[:domain]
      @q = @q.joins(:domains).where( "domains.id" => params[:domain] )
    end

    @profiles = @q.page(params[:page]).per(10)
  end

  def new
    @profile = Profile.new
  end

  def show
    @profile = @user.profile

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @profile = current_user.profile || Profile.new
  end

  def update
    @profile = current_user.profile || current_user.build_profile

    @profile.attributes = profile_params

    if @profile.save
      if params[:next] == "complete"
        redirect_to complete_user_profile_url(current_user)
      else
        redirect_to edit2_user_profile_url(current_user)
      end
    else
      render :action => :edit
    end
  end

  def edit2
    @profile = current_user.profile
  end

  def complete
  end

  protected

  def get_user
    @user = User.find_by_username(params[:user_id])
  end

  def profile_params
    params.require(:profile).permit(:username, :first_name, :last_name, :phone, :avatar, :short_summary, :bio)
  end
end
