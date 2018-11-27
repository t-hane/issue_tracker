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

class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|

      t.references :project, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.date :deadline, null: false
      t.boolean :closed, null: false, default: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
