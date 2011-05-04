class AddRegistrationDateToPatient < ActiveRecord::Migration
  def self.up
    add_column :patients, :registration_date, :date
  end

  def self.down
    remove_column :patients, :registration_date
  end
end
