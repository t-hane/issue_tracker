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
