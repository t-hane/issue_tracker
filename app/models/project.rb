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
# プロジェクト
#
# このアプリケーションではプロジェクトはイシューの集合体として定義されます。
#
class Project < ApplicationRecord

  #
  # プロジェクトの対象となっているイシュー
  #
  has_many :issues, inverse_of: :project, dependent: :destroy

  #
  # バリデーション
  #
  # プロジェクト名、納期、ゴールは必須項目です。
  #
  validates :name, :deadline, :goal, presence: true

  #
  # デフォルトの並び順は、納期が近い順とします。
  #
  default_scope do
    order :deadline, :id
  end

  #
  # @return [Integer] 全イシューの数
  #
  def number_of_issues
    @number_of_issues ||= issues.count
  end

  #
  # @return [Integer] 未解決のイシューの数
  #
  def number_of_open_issues
    @number_of_open_issues ||= issues.open.count
  end

  #
  # @return [Integer] 解決済みのイシューの数
  #
  def number_of_closed_issues
    number_of_issues - number_of_open_issues
  end

  #
  # @return [Float] イシューの進捗率(100分率表示)
  #
  def progress
    @progress ||=
        if number_of_issues != 0
          (number_of_closed_issues.to_f / number_of_issues) * 100
        end
  end
end
