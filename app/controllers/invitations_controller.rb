class InvitationsController < ApplicationController
  def create
    # @case = Case.find(params[:case_id])
    # @invitee = User.find(params[:invitee_id])

    invitation = Invitation.new(
      :case_id => params[:case_id],
      :client_id => current_user.id,
      :translator_id => params[:translator_id],
      :valid_before => Time.now + 1.day
      )

    invitation.save!
    redirect_to :back
  end

  def update
  end

  def destroy
  end
end
