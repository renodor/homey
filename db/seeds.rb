# frozen_string_literal:true

p 'Destroy all Projects'
Project.destroy_all

p 'Destroy all Users'
User.destroy_all

p 'Create Projects'
3.times do |n|
  Project.create!(
    name: "Cool Project #{n + 1}",
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam egestas dictum interdum. Vivamus feugiat mattis orci, id lobortis ipsum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'
  )
end

p 'Create Users'
2.times do |n|
  User.create(
    username: "Cool User #{n + 1}",
    email: "user_#{n + 1}@gmail.com",
    password: 'password'
  )
end

first_user = User.first
last_user = User.last

p 'Add comments and status changes to first project'
first_project = Project.first

first_project.project_status_changes.create!(
  from: first_project.status,
  to: :in_progress,
  user: first_user
)

first_project.comments.create!(
  body: 'Do you know if we should keep an history of status changes? Or displaying the current project status is fine?',
  user: first_user
)

first_project.comments.create!(
  body: 'I think we should keep an history of status changes',
  user: last_user
)

first_project.comments.create!(
  body: 'Alright then consider it done!',
  user: first_user
)

first_project.project_status_changes.create!(
  from: first_project.status,
  to: :to_approve,
  user: first_user
)

first_project.comments.create!(
  body: 'Awesome!',
  user: last_user
)

first_project.project_status_changes.create!(
  from: first_project.status,
  to: :done,
  user: last_user
)
first_project.update!(status: :done)

p 'Add comments and status changes to second project'
second_project = Project.second

second_project.comments.create!(
  body: 'Do you know if this application should be tested? I could create specs with Rspec?',
  user: first_user
)

second_project.comments.create!(
  body: "I don't think this would be necessary for now.",
  user: last_user
)

second_project.comments.create!(
  body: 'Ok, thanks.',
  user: first_user
)

second_project.project_status_changes.create!(
  from: second_project.status,
  to: :done,
  user: first_user
)
second_project.update!(status: :done)
