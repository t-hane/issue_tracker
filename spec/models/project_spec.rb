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
