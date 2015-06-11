class ProfilesController < ApplicationController
  before_action :authenticate_user!, :except => %i[index show]
  before_action :get_user, :only => %i[show edit update destroy]

  def index
    @q = Profile.all

    if params[:lang]
      @q = @q.joins(:languages).where("languages.id = #{params[:lang]}")
    end

    if params[:domain]
      @q = @q.joins(:domains).where("domains.id = #{params[:domain]}")
    end

    @profiles = @q.page(params[:page]).per(10)
  end

  def new
    @profile = Profile.new
  end

  def create
  end

  def show
    @profile = @user.profile

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @profile = current_user.profile || current_user.build_profile
  end

  def edit_pricings
    @profile = current_user.profile || current_user.build_profile
  end

  def update
    @profile = current_user.profile
    @profile.attributes = profile_params

    if @profile.new_record?
      if @profile.save
        redirect_to edit_user_profile_path(current_user)
      else
         render :action => :edit
      end
    else
      if @profile.update(profile_params)
        redirect_to edit_user_profile_path(current_user)
      else
         render :action => :edit
      end
    end
  end

  def update_pricings
    @profile = current_user.profile
    @profile.attributes = profile_params

    if @profile.new_record?
      if @profile.save
        redirect_to edit_pricings_user_profile_path(current_user)
      else
         render :action => :edit_pricings
      end
    else
      if @profile.update(profile_params)
        redirect_to edit_pricings_user_profile_path(current_user)
      else
         render :action => :edit_pricings
      end
    end
  end

  def destroy
  end

  def complete
  end

  protected

  def get_user
    @user = User.find_by_username(params[:user_id])
  end

  def profile_params
    params.require(:profile).permit(:nickname, :avatar, :short_summary, :about, :professional, :education, :certification, :payment_info, :pricings_attributes => [:id, :case_type_id, :amount], :domain_ids => [], :language_ids => [])
  end
end
