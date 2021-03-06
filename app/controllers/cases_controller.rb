class CasesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_case, :only => [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @case = Case.new
  end

  def create
    @case = Case.new(case_params)
    @case.client = current_user

    if @case.save
      redirect_to case_suggestion_path(@case)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @case.update(case_params)
      redirect_to case_suggestion_path(@case)
    else
      render :suggestion
    end
  end

  def destroy
  end

  def suggestion
    @case = Case.find(params[:case_id])

    # quality matching
    @users = User.includes(:profile => :pricings).where("quality_level_id = ?", @case.quality_level_id)

    @q = @users.where( "pricings.case_type_id" => @case.case_type_id )
    @q = @q.ransack(params[:q])
    # !quality matching


    # @users = User.includes(:profile => :pricings).where( "pricings.case_type_id" => @case.case_type_id )

    # @q = @users.ransack(params[:q])
    # @q.sorts = 'average_rating DESC' if @q.sorts.empty?
    @suggested_translators = @q.result.page(params[:page]).per(10)

    if params[:sort] == "pricing"
      @suggested_translators = @suggested_translators.order("pricings.amount ASC")
    end

  end

  def submit_request

  end

  protected

  def get_case
    @case = Case.find(params[:id])
  end

  def case_params
    params.require(:case).permit(:client_id, :case_type_id, :domain_id, :word_count, :due, :expire, :quality_level_id)
  end
end
