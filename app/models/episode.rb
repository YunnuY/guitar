class Episode < ActiveRecord::Base
  attr_accessible :comments_count, :description, :name, :notes, :published_at, :seconds, :youku
end
