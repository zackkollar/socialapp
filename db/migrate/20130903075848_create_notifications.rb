class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :type
      t.integer :content_id
      t.integer :bit_id
      t.boolean :seen

      t.timestamps
    end
  end
end
