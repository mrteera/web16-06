FactoryGirl.define do
  factory :admin, class: User do
    email "resma.dangol@email.com"
    password "password"
    password_confirmation "password"
    is_admin true
  end
  factory :member, class: User do
    email "kan@email.com"
    password "password"
    password_confirmation "password"
    is_admin false
  end
  factory :inappropriate_member, class: User do
    email "teera@gmail.com"
    password "password"
    password_confirmation "password"
    is_admin true
  end
  factory :banned_member, class: User do
    email "teera+spam@gmail.com"
    password "password"
    password_confirmation "password"
    is_admin true
    is_banned true
  end

end