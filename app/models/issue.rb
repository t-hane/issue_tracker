class Issue < ApplicationRecord

  belongs_to :project, inverse_of: :issues

  belongs_to :user, inverse_of: :issues


  scope :open, -> { where closed: false }
  scope :closed, -> { where closed: true }

  default_scope do
    order(:closed, :deadline, :id)
  end

  validates :title, :content, :deadline, presence: true

  #
  # イシューをクローズします。
  #
  def close!
    self.closed = true
    save!
  end
end
