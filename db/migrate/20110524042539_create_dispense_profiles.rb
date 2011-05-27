class CreateDispenseProfiles < ActiveRecord::Migration
  def self.up
    create_table :dispense_profiles do |t|
      t.references :prescription
      t.string :day_name
      t.timestamps
    end
  end

  def self.down
    drop_table :dispense_profiles
  end
end
