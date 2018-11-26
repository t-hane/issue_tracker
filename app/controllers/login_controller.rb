# noinspection RailsChecklist01
class LoginController < ApplicationController

  def show
    if current_user.present?
      redirect_to :projects
    else
      @user = User.new
    end
  end

  def create
    user = User.authenticate params.require(:user).permit(:username, :password)

    if user.present?
      session[:user_id] = user.id
      redirect_to :projects
    else
      redirect_to :root
    end
  end

  def destroy
    reset_session
    redirect_to :root
  end
end
