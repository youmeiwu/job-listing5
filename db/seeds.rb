# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "This seed will automatically create one admin acount, 10 public jobs and 10 hidden jobs"

create_account = User.create([email: "a@gmail.com", password: "123456", password_confirmation: "123456", is_admin: "true"])
puts "admin account created"

create_jobs = for i in 1..10 do
  Job.create!([title: "Job no.#{i}", description: "no.#{i} public job generated with seed", wage_upper_bound: rand(50..90)*1000, wage_lower_bound: rand(1..49)*1000, is_hidden: "false"])
end
puts "10 public jobs created"

create_jobs = for i in 1..10 do
  Job.create!([title: "Job no.#{i+10}", description: "no.#{i+10} hidden job generated with seed", wage_upper_bound: rand(50..90)*1000, wage_lower_bound: rand(1..49)*1000, is_hidden: "true"])
end
puts "10 hidden jobs created"
