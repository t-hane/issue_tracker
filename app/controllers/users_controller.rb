#
# This file is part of IssueTracker.
#
# IssueTracker is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# IssueTracker is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with IssueTracker.  If not, see <http://www.gnu.org/licenses/>.
#

# noinspection RailsChecklist01
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
