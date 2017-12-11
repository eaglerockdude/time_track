FactoryBot.define do
  factory :user do
    email 'fbot_user@gmail.com'
    first_name 'ken'
    last_name 'mcfadden'
    password 'password'
    password_confirmation 'password'
  end
  factory :another_user , class: AdminUser do
    email 'fbot_another_user@gmail.com'
    first_name 'Dude'
    last_name 'mcfadden'
    password 'password'
    password_confirmation 'password'
  end
end