class AddFromIdToNotification < ActiveRecord::Migration
  def change
    add_column :notifications, :from_id, :integer
  end
end
