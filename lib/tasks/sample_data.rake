namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(first_name: "Kelly",
                         last_name: "Wang",
                         email: "kelly@wang.com",
                         password: "111111",
                         password_confirmation: "111111",
                         admin: true)
  end
end