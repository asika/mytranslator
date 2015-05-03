class CasesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @case = Case.new
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

  protected

  def case_params
    params.require(:case).permit(:client_id, :case_type_id, :domain_id, :word_count, :due, :valid_before, :quality_level)
  end
end
