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

class ApplicationController < ActionController::Base

  helper_method :current_user


  protected

  #
  # 現在ログイン中のユーザーを取得します。
  #
  # @return [User]
  #
  def current_user
    @current_user ||= begin
      if session[:user_id].present?
        User.find session[:user_id]
      end
    end
  end


  private

  def enforce_login
    if current_user.blank?
      redirect_to :root
    end
  end
end
