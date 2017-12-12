FactoryBot.define do
  factory :user do
    # email 'fbot_user@gmail.com'
    sequence(:email) { |n| "fbot_user#{n}@example.com" }
    first_name 'ken'
    last_name 'mcfadden'
    password 'password'
    password_confirmation 'password'
  end
  factory :another_user, class: AdminUser do
    sequence(:email) { |n| "another_fbot_user#{n}@example.com" }
    first_name 'Dude'
    last_name 'mcfadden'
    password 'password'
    password_confirmation 'password'
  end
end