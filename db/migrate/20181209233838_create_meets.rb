class CreateMeets < ActiveRecord::Migration[5.2]
  def change
    create_table :meets do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.string :location
      t.date :meetdate
      t.time :meetime
      t.string :ava
      t.string :bg

      t.timestamps
    end
  end
end
