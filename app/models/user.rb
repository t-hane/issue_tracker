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

#
# ユーザー
#
# アプリケーションのユーザーであり、イシューの実行者。
#
class User < ApplicationRecord

  has_secure_password

  #
  # アサインされているイシュー（マイイシュー）
  #
  has_many :issues, inverse_of: :user

  #
  # バリデーション
  # ユーザー名、氏名、メールアドレスは必須
  #
  validates :username, :name, :email, presence: true
  #
  # ユーザー名はアプリケーションでユニーク
  #
  validates :username, uniqueness: true

  #
  # ユーザーの認証を行います。
  #
  # @param [Hash] credential 認証情報
  #  username: ユーザー名
  #  password: パスワード
  #
  # @return [User] 認証が成功すれば、該当するユーザーのオブジェクトを返却します。
  #
  def self.authenticate(credential)
    user = User.where(username: credential[:username]).first
    if user.present?
      user.authenticate credential[:password]
    end
  end
end
