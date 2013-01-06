# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'First User', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
user.confirm!
puts 'New user created: ' << user.name
user2 = User.create! :name => 'Second User', :email => 'user2@example.com', :password => 'please', :password_confirmation => 'please'
user2.confirm!
puts 'New user created: ' << user2.name
user.add_role :admin

puts "setting sample episodes"
episode1 = Episode.create! :name => "episode1", :notes => "notes1", :published_at => "2012-12-03", :seconds => 10, :description => "description1", :comments_count => 0, :youku => "www.youku.com"

puts "setting sample comments"
comment1 = Comment.create! :episode_id => 1, :content => "comment1 content", :name => "First User", :email => "email@email.com", :user_id =>
1, :ancestry => "ancestry"




