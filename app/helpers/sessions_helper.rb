module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
