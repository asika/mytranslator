class ProfilesController < ApplicationController
  before_action :authenticate_user!, :except => %i[index show]
  before_action :get_user, :only => %i[show edit update destroy]

  def index
    # @profiles = Profile.all
    @profiles = Profile.page(params[:page]).per(10)

    # if params[:cate] == "0"
    #   # uncategoried
    #   uncat = Topic.select {|r| r.categories.size == 0}

    #   # convert array to ActiveRecord::Relation
    #   # http://stackoverflow.com/questions/17331862/converting-an-array-of-objects-to-activerecordrelation
    #   @topics = Topic.where(id: uncat.map(&:id))

    # elsif params[:cate]
    #   @topics = Category.find(params[:cate]).topics
    # end

    # @q = @topics.ransack(params[:q])
    # @q.sorts = 'updated_at DESC' if @q.sorts.empty?
    # @topics = @q.result.page(params[:page])
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
