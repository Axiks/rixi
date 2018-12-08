class CreateMeets < ActiveRecord::Migration[5.2]
  def change
    create_table :meets do |t|
      t.string :title
      t.text :description
      t.string :location
      t.datetime :meetdate
      t.string :ava
      t.string :bg

      t.timestamps
    end
  end
end
