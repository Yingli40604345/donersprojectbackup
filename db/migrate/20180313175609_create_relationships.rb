class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :doner_id
      t.integer :target
      t.string :link_description

      t.timestamps null: false
    end
  end
end
