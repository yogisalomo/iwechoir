class CreateMeetingResults < ActiveRecord::Migration
  def change
    create_table :meeting_results do |t|
      t.date :date
      t.string :location
      t.text :summary
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
