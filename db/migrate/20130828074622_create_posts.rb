class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body
      t.integer :bit_id
      t.belongs_to :bit
      t.timestamps
    end
  end
end
