class CreateDispenses < ActiveRecord::Migration
  def self.up
    create_table :dispenses do |t|
      t.references :prescriptions
      t.date :date_of_dispense
      t.boolean :is_local_patient
      t.string :no_of_dose
      t.timestamps
    end
    add_index :dispenses, :prescriptions_id
  end

  def self.down
    drop_table :dispenses
  end
end
