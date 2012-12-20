class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :name
      t.text :notes
      t.datetime :published_at
      t.integer :seconds
      t.text :description
      t.integer :comments_count, :default => 0
      t.string :youku

      t.timestamps
    end
  end
end
