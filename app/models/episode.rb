class Episode < ActiveRecord::Base

  has_many :comments, :dependent => :destroy

  attr_accessible :comments_count, :description, :name, :notes, :published_at, :seconds, :youku, :title, :play_url, :thumb_pic_url, :uploader, :duration_in_secs, :source_site, :status

  def asset_name
    [id.to_s.rjust(3, "0"), name].join("-")
  end
  # a virtual attribute
  def tag_names=(names)
    self.tags = Tag.with_names(names.split(/\s+/))
  end
  def tag_names
    tags.map(&:name).join(' ')
  end

end
