100.times do |n|
  User.create(email: "user_n#{n}@email.com", password: '123123123', username: "user_n#{n}")
end