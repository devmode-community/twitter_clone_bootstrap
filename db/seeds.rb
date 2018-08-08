100.times do |n|
  user = User.create(email: "user_n#{n}@email.com", password: '123123123', username: "user_n#{n}")

  20.times do |n|
    user.tweets.create(content: "Some content ##{n}")
  end
end