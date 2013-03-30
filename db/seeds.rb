# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create! :name => 'User', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
user.confirm!

user2 = User.create! :name => 'User2', :email => 'user2@example.com', :password => 'please', :password_confirmation => 'please'
user2.confirm!
user.add_role :admin

50.times do |index|
  episode = Episode.create! :name => "episode#{index}", 
                            :notes => "notes#{index}", 
                            :published_at => "2012-12-03", 
                            :seconds => 10, 
                            :description => "description1", 
                            :comments_count => 0, 
                            :youku => "www.youku.com"
  puts "episode #{episode.id} created"
  (Random.rand(5)).times do |index2|
    comment = Comment.create! :episode_id => episode.id, 
                    :content => "comment content", 
                    :name => user.name, 
                    :email => user.email, 
                    :user_id => user.id
  puts "comment #{comment.id} for episode #{episode.id} created"
  end
end
