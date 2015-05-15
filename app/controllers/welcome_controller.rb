class WelcomeController < ApplicationController
  before_action :authenticate_user!, :only => ['intro']

  def index
  end

  def intro
  end
end
