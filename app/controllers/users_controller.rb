class UsersController < ApplicationController
  def index
	@users = User.all
	if stale? @users
		respond_to do |format|
			format.html
			format.json { render json: @users }
		end
	end
  end

  def show
 	@user = User.find(params[:id])
	fresh_when last_modified: @user.updated_at
  end
end
