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

FactoryBot.define do
  factory :issue do
    sequence(:title) { |n| "テストイシュー#{n}" }
    sequence(:deadline) { |n| n.days.after }
    sequence(:content) { |n| "テストイシュー内容#{n}" }
  end
end
