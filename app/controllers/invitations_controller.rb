class InvitationsController < ApplicationController
  def create
    invitation = Invitation.new(
      :case_id => params[:case_id],
      :client_id => current_user.id,
      :translator_id => params[:translator_id],
      :expire => Time.now + 1.day
      )

    invitation.save!

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def update
  end

  def destroy
  end
end
