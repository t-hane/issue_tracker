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

RSpec.describe User, type: :model do
  before do
    @user = build :user
  end

  it 'is valid if all attributes filled properly.' do
    expect(@user.valid?).to eq(true)
  end

  it 'is invalid if username is blank.' do
    @user.username = '   '
    expect(@user.valid?).to be_falsey
    expect(@user.errors[:username]).to be_present
  end

  it 'is invalid if name is blank.' do
    @user.name = '   '
    expect(@user.valid?).to be_falsey
    expect(@user.errors[:name]).to be_present
  end

  it 'is invalid if email is blank.' do
    @user.email = '   '
    expect(@user.valid?).to be_falsey
    expect(@user.errors[:email]).to be_present
  end

  it 'is invalid if password is blank.' do
    @user.password = nil
    expect(@user.valid?).to be_falsey
    expect(@user.errors[:password]).to be_present
  end

  it 'is invalid if password_confirmation is invalid.' do
    @user.password_confirmation = 'different'
    expect(@user.valid?).to be_falsey
    expect(@user.errors[:password_confirmation]).to be_present
  end

end
