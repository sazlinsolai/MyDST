class AddAvatarToPatient < ActiveRecord::Migration
  def self.up
    add_column :patients, :avatar, :string
  end

  def self.down
    remove_column :patients, :avatar
  end
end
