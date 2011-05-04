class CreateDistricts < ActiveRecord::Migration
  def self.up
    create_table :districts do |t|
      t.string :name
      t.references :state
      t.timestamps
    end
    add_index :districts, :state_id
  end

  def self.down
    drop_table :districts
  end
end
