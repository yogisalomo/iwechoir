class CreateWorshipSongs < ActiveRecord::Migration
  def change
    create_table :worship_songs do |t|
      t.string :title
      t.text :text
      t.string :file
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
