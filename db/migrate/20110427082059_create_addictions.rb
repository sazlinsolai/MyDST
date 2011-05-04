class CreateAddictions < ActiveRecord::Migration
  def self.up
    create_table :addictions do |t|
      t.integer :age_start_addiction
      t.integer :sum_addiction
      t.integer :period_addiction_month
      t.integer :period_injection_month
      t.integer :period_injection_year
      t.references :patient
      t.timestamps
    end
    add_index :addictions, :patient_id
  end

  def self.down
    drop_table :addictions
  end
end
