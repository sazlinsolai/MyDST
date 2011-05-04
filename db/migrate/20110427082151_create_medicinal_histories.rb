class CreateMedicinalHistories < ActiveRecord::Migration
  def self.up
    create_table :medicinal_histories do |t|
      t.string :name_of_medicine
      t.string :remarks
      t.references :patient
      t.timestamps
    end
    add_index :medicinal_histories, :patient_id
  end

  def self.down
    drop_table :medicinal_histories
  end
end
