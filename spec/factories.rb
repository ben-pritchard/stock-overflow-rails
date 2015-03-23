FactoryGirl.define do
  factory(:user) do
    email('bob@bob.com')
    password('password123')
    password_confirmation('password123')
  end
end
