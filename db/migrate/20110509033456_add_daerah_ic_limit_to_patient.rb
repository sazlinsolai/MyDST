class AddDaerahIcLimitToPatient < ActiveRecord::Migration
  def self.up
    change_column :patients, :ic_no, :string, :limit => 25
    add_column :patients, :daerah, :string
  end

  def self.down
    change_column :patients, :ic_no, :string, :limit => 8
    remove_column :patients, :daerah
  end
end
