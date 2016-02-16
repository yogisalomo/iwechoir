class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
    	t.string :name
    	t.string :email
    	t.string :phone
    	t.integer :role
    	t.date :active_start
    	t.date :active_end
    	t.string :image
    	t.date :birthday
    	t.timestamps null: false
    end
  end
end
