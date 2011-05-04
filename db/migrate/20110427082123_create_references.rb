class CreateReferences < ActiveRecord::Migration
  def self.up
    create_table :references do |t|
      t.string :category
      t.timestamps
    end
  end

  def self.down
    drop_table :references
  end
end
