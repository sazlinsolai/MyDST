class CreateRelatives < ActiveRecord::Migration
  def self.up
    create_table :relatives do |t|
      t.string :name
      t.string :address
      t.string :phone_no
      t.references :patient
      t.references :state
      t.references :district
      t.timestamps
    end
    add_index :relatives, :patient_id
    add_index :relatives, :state_id
    add_index :relatives, :district_id
  end

  def self.down
    drop_table :relatives
  end
end
