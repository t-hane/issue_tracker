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
# イシュー
#
# トラッキングするイシューを定義します。
#
class Issue < ApplicationRecord

  #
  # イシューをまとめているプロジェクト
  #
  belongs_to :project, inverse_of: :issues

  #
  # イシューにアサインされているユーザー
  #
  belongs_to :user, inverse_of: :issues

  #
  # 未解決のイシュー
  #
  scope :open, -> { where closed: false }

  #
  # 解決済みのイシュー
  #
  scope :closed, -> { where closed: true }

  #
  # デフォルトの並び順を、未解決で期限が近いもの順とします。
  #
  default_scope do
    order(:closed, :deadline, :id)
  end

  #
  # バリデーション
  #
  # タイトル、内容、納期は必須項目です。
  #
  validates :title, :content, :deadline, presence: true

  #
  # イシューをクローズします。
  #
  def close!
    self.closed = true
    save!
  end
end
