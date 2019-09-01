class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
    else
      flash.now[:danger] = 'Wrong email/password'
      render 'new'
    end
  end
end
