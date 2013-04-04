class Episode < ActiveRecord::Base

  has_many :comments, :dependent => :destroy

  attr_accessible :comments_count, :name, :notes, :published_at, :seconds, :title, :play_url, :img_url, :uploader, :source_site, :status

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
