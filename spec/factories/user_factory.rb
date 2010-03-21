Factory.define :user do |u|
  u.email "test@test.com"
  u.password 'test'
  u.password_confirmation 'test'
  u.email_confirmed true
  u.admin false
end
