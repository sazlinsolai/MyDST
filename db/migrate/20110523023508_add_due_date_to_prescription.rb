class AddDueDateToPrescription < ActiveRecord::Migration
  def self.up
    add_column :prescriptions, :prescription_due_date, :date
    add_column :prescriptions, :dispense_type, :string
  end

  def self.down
    remove_column :prescriptions, :prescription_due_date
    remove_column :prescriptions, :dispense_type
  end
end
