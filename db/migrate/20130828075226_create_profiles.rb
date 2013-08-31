class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :firstname
      t.string :lastname
      t.string :bio
      t.string :location
      t.boolean :location_visible, :default => true
      t.string :website

      t.timestamps
    end
  end
end
