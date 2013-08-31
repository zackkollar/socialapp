class AddAvatarFileNameToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :avatar_file_name, :string
  end
end
