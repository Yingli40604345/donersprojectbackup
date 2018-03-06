class AddUserIdToDoners < ActiveRecord::Migration
  def change
    add_column :doners, :user_id, :integer
  end
end
