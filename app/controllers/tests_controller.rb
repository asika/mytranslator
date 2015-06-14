class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_test, :only => [:edit, :update, :submit]

  def create
    case_type_id = params[:case_type_id]
    ct = CaseType.find(case_type_id)

    @test = current_user.profile.tests.build(
      :test_source => TestSource.get_by_type(ct)
      )
    @test.save!

    redirect_to edit_user_profile_test_path(current_user, @test)
  end

  def edit
  end

  def update
    if @test.update(test_params)
      flash[:notice] = I18n.t("controller.tests.update.update_success")
    else
      flash[:alert] = I18n.t("controller.tests.update.update_failed")
    end

    render :edit
  end

  def submit
    if @test.submit_time.nil?
      @test.submit_time = Time.now

      @test.save!
      redirect_to user_profile_test_complete_path(@test)
    else
      flash[:alert] = I18n.t("controller.tests.submit.error_multiple_submit")

      redirect_to edit_user_profile_path(current_user)
    end

  end

  def self.certify
    case_type_id = params[:case_type_id]

    pr = current_user.profile.pricings.find_or_initialize_by(:case_type_id => case_type_id)
    pr.update(:certified => true)

    pr.save!
    redirect_to edit_user_profile_path(current_user)
  end

  protected

  def get_test
    @test = Test.find_by_friendly_id(params[:id])
  end

  def test_params
    params.require(:test).permit(:answer)
  end
end
