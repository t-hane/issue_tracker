FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "username_#{n}" }
    sequence(:name) { |n| "テスト名前#{n}" }
    sequence(:email) { |n| "username_#{n}@example.com" }
    password { 'test' }
    password_confirmation { 'test' }
  end
end
