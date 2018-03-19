class AddAttachmentImageToDonors < ActiveRecord::Migration
  def self.up
    change_table :donors do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :donors, :image
  end
end
