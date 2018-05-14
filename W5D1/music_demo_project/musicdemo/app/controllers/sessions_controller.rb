class SessionsController < ApplicationController
  def new #signup
    render :new
  end

  def create #login
    @user = User.find_by_credentials(params[:user][:email],params[:user][:password])
    if @user.nil?
      flash.now[:errors] = ['Incorrect login']
      render :new
    else
      login_user!(@user)
      redirect_to user_url(@user)
    end
  end

  def destroy #logout
     if current_user
      current_user.reset_session_token!
      session[:session_token] = nil

      redirect_to new_session_url
    end
  end

end
