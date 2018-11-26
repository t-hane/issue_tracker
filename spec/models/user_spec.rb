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
