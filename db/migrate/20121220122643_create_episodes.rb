class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :name
      t.text :notes
      t.datetime :published_at
      t.integer :seconds
      t.integer :comments_count, :default => 0
      t.string :play_url
      t.string :img_url
      t.string :uploader
      t.string :source_site
      t.string :status

      t.timestamps
    end
  end
end
