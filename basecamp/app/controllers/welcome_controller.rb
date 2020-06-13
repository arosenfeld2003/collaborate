class WelcomeController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index
    if user_signed_in?
      @projects = Project.where("user_id=?", current_user.id)
    end
  end
end
