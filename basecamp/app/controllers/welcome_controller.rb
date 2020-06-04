class WelcomeController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index
    @projects = Project.all
    @members = Member.all
  end
end
