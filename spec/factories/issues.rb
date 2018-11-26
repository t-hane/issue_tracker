FactoryBot.define do
  factory :issue do
    sequence(:title) { |n| "テストイシュー#{n}" }
    sequence(:deadline) { |n| n.days.after }
    sequence(:content) { |n| "テストイシュー内容#{n}" }
  end
end
