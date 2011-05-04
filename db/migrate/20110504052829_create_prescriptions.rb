class CreatePrescriptions < ActiveRecord::Migration
  def self.up
    create_table :prescriptions do |t|
      t.references :dispense
      t.references :patient
      t.date :date_of_prescription
      t.string :medicine_dose
      t.string :uom
      t.string :period
      t.string :name_of_doctor
      t.string :remarks
      t.timestamps
    end
    add_index :prescriptions, :dispense_id
    add_index :prescriptions, :patient_id
  end

  def self.down
    drop_table :prescriptions
  end
end
