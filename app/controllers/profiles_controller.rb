class ProfilesController < ApplicationController
  before_action :authenticate_user!, :except => %i[index show]
  before_action :get_user, :only => %i[show edit update destroy]

  def index
    # elsif params[:cate]
    #   @topics = Category.find(params[:cate]).topics
    # end

    # @q = @topics.ransack(params[:q])
    # @q.sorts = 'updated_at DESC' if @q.sorts.empty?
    # @topics = @q.result.page(params[:page])

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
    @user = User.find_by_username(params[:user_id])
  end

  def profile_params
    params.require(:profile).permit(:username, :first_name, :last_name, :phone, :avatar, :short_summary, :bio)
  end
end
