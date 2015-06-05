class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if current_user.role == Role.find_by_name('client')
      new_case_path
    else
      edit_user_profile_path
    end
  end
end