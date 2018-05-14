class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def new #webpage
    @user = User.new
    render :new
  end

  def create #creation
    # debugger
    @user = User.new(user_params)

    if @user.save
      login_user!(@user)
      redirect_to users_url(@user)
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
