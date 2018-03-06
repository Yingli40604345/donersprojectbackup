class CreateDoners < ActiveRecord::Migration
  def change
    create_table :doners do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :race
      t.string :religion
      t.decimal :networth
      t.string :employer
      t.string :position
      t.string :education
      t.string :associations
      t.string :military
      t.string :location
      t.string :zip
      t.text :description
      t.string :life_event
      t.decimal :donation_goal
      t.decimal :donation_YTD

      t.timestamps null: false
    end
  end
end
