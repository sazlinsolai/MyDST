class ChangeReferenceInDispense < ActiveRecord::Migration
  def self.up
    remove_column :dispenses,:prescriptions_id
    add_column :dispenses, :prescription_id, :integer
  end

  def self.down
    add_column :dispenses, :prescriptions_id, :integer
    remove_column :dispenses, :prescription_id
  end
end
