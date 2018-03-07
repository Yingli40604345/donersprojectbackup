class AddAttachmentImageToDoners < ActiveRecord::Migration
  def self.up
    change_table :doners do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :doners, :image
  end
end
