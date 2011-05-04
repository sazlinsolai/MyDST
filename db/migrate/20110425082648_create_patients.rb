class CreatePatients < ActiveRecord::Migration
  def self.up
    create_table :patients do |t|
      t.string :name, :limit => 50
      t.string :ic_no, :limit => 8
      t.string :old_ic
      t.date :birthdate
      t.integer :age
      t.string :work_category
      t.string :status
      t.string :transfer
      t.string :race
      t.string :occupation
      t.string :address
      t.string :postcode
      t.integer :state_id
      t.integer :district_id
      t.timestamps
    end
  end

  def self.down
    drop_table :patients
  end
end
