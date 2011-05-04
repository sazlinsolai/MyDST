class AddFileNoToPatient < ActiveRecord::Migration
  def self.up
    add_column :patients, :file_no, :string
  end

  def self.down
    remove_column :patients, :file_no
  end
end
