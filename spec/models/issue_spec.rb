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
