class AddAttachmentAvatarToBits < ActiveRecord::Migration
  def self.up
    change_table :bits do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :bits, :avatar
  end
end
