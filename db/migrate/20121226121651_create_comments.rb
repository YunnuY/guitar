class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :episode_id
      t.text :content
      t.string :name
      t.string :email
      t.integer :user_id
      t.string :ancestry

      t.timestamps
    end
  end
end
