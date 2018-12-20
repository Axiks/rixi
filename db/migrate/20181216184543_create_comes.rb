class CreateComes < ActiveRecord::Migration[5.2]
  def change
    create_table :comes do |t|
	  t.integer :user_id
      t.integer :meet_id
      t.boolean :come, default: false

      t.timestamps
    end
  end
end
