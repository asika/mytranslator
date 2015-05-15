class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user, :only => %i[show edit update destroy]

  def index
  end

  def show
    if params[:status]
      if params[:status] == 'finish'
        @cases = @user.cases_finish
      end
    else
      @cases = @user.cases_ongoing
    end

    @q = @cases.ransack(params[:q])
    @q.sorts = 'status DESC' if @q.sorts.empty?
    @cases = @q.result.page(params[:page]).per(10)
  end

  protected

  def get_user
    @user = User.find_by_username(params[:id])
  end
end
