class SessionsController < ApplicationController

  skip_before_filter :ensure_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by_login(params[:user][:login])
    if (user && user.authenticate(params[:user][:password]))
      session[:user_id] = user.id
      redirect_to '/', noteice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid username/password combination'
      render action: 'new'
    end

  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'You have been logged out'
  end
end
