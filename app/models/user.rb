#
# ユーザー
#
# アプリケーションのユーザーであり、イシューの実行者。
#
class User < ApplicationRecord

  has_secure_password

  #
  # アサインされているイシュー（マイイシュー）
  #
  has_many :issues, inverse_of: :user

  #
  # バリデーション
  # ユーザー名、氏名、メールアドレスは必須
  #
  validates :username, :name, :email, presence: true
  #
  # ユーザー名はアプリケーションでユニーク
  #
  validates :username, uniqueness: true

  #
  # ユーザーの認証を行います。
  #
  # @param [Hash] credential 認証情報
  #  username: ユーザー名
  #  password: パスワード
  #
  # @return [User] 認証が成功すれば、該当するユーザーのオブジェクトを返却します。
  #
  def self.authenticate(credential)
    user = User.where(username: credential[:username]).first
    if user.present?
      user.authenticate credential[:password]
    end
  end
end
