FactoryBot.define do
  factory :user do
    name { "test" }
    email { "test@example.com" }
    password { "password" }
    password_confirmation { "password" }
    id { 1 }
  end
end
