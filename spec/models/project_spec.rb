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

RSpec.describe Project, type: :model do

  before do
    @project = build :project
  end

  it 'is valid if all attributes filled properly.' do
    expect(@project.valid?).to eq(true)
  end

  it 'is invalid if name is blank.' do
    @project.name = '   '
    expect(@project.valid?).to be_falsey
    expect(@project.errors[:name]).to be_present
  end

  it 'is invalid if goal is blank.' do
    @project.goal = '   '
    expect(@project.valid?).to be_falsey
    expect(@project.errors[:goal]).to be_present
  end

  it 'is invalid if deadline is blank.' do
    @project.deadline = '   '
    expect(@project.valid?).to be_falsey
    expect(@project.errors[:deadline]).to be_present
  end
end
