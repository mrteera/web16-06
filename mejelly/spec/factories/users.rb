FactoryGirl.define do
  factory :banned_member, class: User do
    email "teera+spam@gmail.com"
    password "password"
    password_confirmation "password"
    is_admin true
    is_banned true
  end
end
