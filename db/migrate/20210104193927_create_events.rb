class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :description, null: false 
      t.string :location, null: false 
      t.date :date 
      t.references :creator 
      t.timestamps
    end
  end
end
