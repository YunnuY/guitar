class AddColumnsToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :title, :string
    add_column :episodes, :play_url, :string
    add_column :episodes, :thumb_pic_url, :string
    add_column :episodes, :uploader, :string
    add_column :episodes, :duration_in_secs, :integer
    add_column :episodes, :source_site, :string
    add_column :episodes, :status, :string
  end
end
