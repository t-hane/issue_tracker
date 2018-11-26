class User < ApplicationRecord

  has_secure_password

  has_many :issues, inverse_of: :user

  validates :username, :name, :email, presence: true
  validates :username, uniqueness: true

  def self.authenticate(params)
    user = User.where(username: params[:username]).first
    if user.present?
      user.authenticate params[:password]
    end
  end
end
