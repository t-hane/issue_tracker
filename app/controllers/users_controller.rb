class UsersController < ApplicationController

  before_action :enforce_login

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params.require(:user)
                         .permit(:username, :email, :password, :password_confirmation)
    User.transaction do
      @user.save!
    end

    redirect_to :users

  rescue ActiveRecord::RecordInvalid
    render action: :new

  end

  def edit
    @user = User.find params[:id]
  end

  def update
    User.transaction do
      @user = User.find params[:id]
      @user.attributes = params.require(:user).permit(:username, :email, :password, :password_confirmation)
      @user.save!
    end

    redirect_to :users

  rescue ActiveRecord::RecordInvalid
    render action: :edit

  end
end
