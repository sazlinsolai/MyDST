class RemoveDispenseIdFromPrescription < ActiveRecord::Migration
  def self.up
    
    remove_column :prescriptions, :dispense_id
    
  end

  def self.down
    add_column :prescriptions, :dispense_id, :integer
    
  end
end
