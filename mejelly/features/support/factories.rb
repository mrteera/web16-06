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

end