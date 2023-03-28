# frozen_string_literal:true

p 'Destroy all Projects'
Project.destroy_all

p 'Destroy all Users'
User.destroy_all

p 'Create Projects'
3.times do |n|
  Project.create!(
    name: "Cool Project #{n + 1}",
    status: rand(4),
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam egestas dictum interdum. Vivamus feugiat mattis orci, id lobortis ipsum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'
  )
end

p 'Create Users'
2.times do |n|
  User.create(
    username: "cool_user_#{n + 1}",
    email: "user_#{n + 1}@gmail.com",
    password: 'password'
  )
end
