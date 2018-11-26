FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "テストプロジェクト#{n}" }
    sequence(:deadline) { |n| n.days.after }
    sequence(:goal) { |n| "ゴール#{n}" }
  end
end
