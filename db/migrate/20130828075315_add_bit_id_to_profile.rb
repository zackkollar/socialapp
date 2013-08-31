class AddBitIdToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :bit_id, :integer
  end
end
