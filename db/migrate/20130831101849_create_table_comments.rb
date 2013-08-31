class CreateTableComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.integer :bit_id
      t.text :body
      t.boolean :reply
      t.integer :reply_id

      t.timestamps
    end
  end
end
