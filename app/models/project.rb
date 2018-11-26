class Project < ApplicationRecord

  has_many :issues, inverse_of: :project, dependent: :destroy

  validates :name, :deadline, :goal, presence: true

  default_scope do
    order id: :desc
  end

  def number_of_issues
    @number_of_issues ||= issues.count
  end

  def number_of_open_issues
    @number_of_open_issues ||= issues.open.count
  end

  def number_of_closed_issues
    number_of_issues - number_of_open_issues
  end

  def progress
    @progress ||=
        if number_of_issues != 0
          (number_of_closed_issues.to_f / number_of_issues) * 100
        end
  end
end
