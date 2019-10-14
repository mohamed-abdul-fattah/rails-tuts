class UsersController < ApplicationController
  def index
  end

  def show
	@user = User.find(params[:id])
	fresh_when last_modified: @user.updated_at
  end
end

