#
# イシュー
#
# トラッキングするイシューを定義します。
#
class Issue < ApplicationRecord

  #
  # イシューをまとめているプロジェクト
  #
  belongs_to :project, inverse_of: :issues

  #
  # イシューにアサインされているユーザー
  #
  belongs_to :user, inverse_of: :issues

  #
  # 未解決のイシュー
  #
  scope :open, -> { where closed: false }

  #
  # 解決済みのイシュー
  #
  scope :closed, -> { where closed: true }

  #
  # デフォルトの並び順を、未解決で期限が近いもの順とします。
  #
  default_scope do
    order(:closed, :deadline, :id)
  end

  #
  # バリデーション
  #
  # タイトル、内容、納期は必須項目です。
  #
  validates :title, :content, :deadline, presence: true

  #
  # イシューをクローズします。
  #
  def close!
    self.closed = true
    save!
  end
end
