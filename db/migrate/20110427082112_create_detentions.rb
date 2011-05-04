class CreateDetentions < ActiveRecord::Migration
  def self.up
    create_table :detentions do |t|
      t.integer :year_of_detention
      t.references :patient
      t.timestamps
    end
    add_index :detentions, :patient_id
  end

  def self.down
    drop_table :detentions
  end
end
