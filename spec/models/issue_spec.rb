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

require 'rails_helper'

RSpec.describe Issue, type: :model do
  before do
    @issue = build :issue, project: create(:project), user: create(:user)
  end

  it 'is valid if all attributes filled properly.' do
    expect(@issue.valid?).to be_truthy
  end

  it 'is invalid if user is not specified.' do
    @issue.user = nil
    expect(@issue.valid?).to be_falsey
    expect(@issue.errors[:user]).to be_present
  end

  it 'is invalid if project is not specified.' do
    @issue.project = nil
    expect(@issue.valid?).to be_falsey
    expect(@issue.errors[:project]).to be_present
  end

  it 'is invalid if title is blank.' do
    @issue.title = '   '
    expect(@issue.valid?).to be_falsey
    expect(@issue.errors[:title]).to be_present
  end

  it 'is invalid if content is blank.' do
    @issue.content = '   '
    expect(@issue.valid?).to be_falsey
    expect(@issue.errors[:content]).to be_present
  end

  it 'is invalid if deadline is blank.' do
    @issue.deadline = '   '
    expect(@issue.valid?).to be_falsey
    expect(@issue.errors[:deadline]).to be_present
  end
end
