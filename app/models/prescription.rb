class Prescription < ActiveRecord::Base

  has_many :dispenses
  has_many :dispense_profiles
  belongs_to :patient

  accepts_nested_attributes_for :dispense_profiles

  HARI = {"Isnin" => "Monday", "Selasa" => "Tuesday"}
  
  # constructing the JSON structure for prescription model
  def as_json(options={})
    {:id => id, :name => name}
  end
  
end
