# Homey Technical Test
## Built with:
* Ruby 3.0.0
* Rails 7
* PostgreSQL
* Devise for authentication
* Tailwind css

## Setup
* `rails db:create` to create the Databse
* `rails db:migrate` to run migrations
* `rails db:seed` to run seeds
* `bundle install` to install dependencies
* `bin/dev` to launch dev server on `localhost:3000`

## Authentication
You need to login in order to access the app.
A demo user with the following credentials is created when running the seeds and can be used to login:
* email: `user_1@gmail.com`
* password: `password`

## App usage
Once authenticated you should see a list of projects. You can access a project by clicking on it.
First and second projects should have comments and status changes.
You can then add comments and change status of any project.
