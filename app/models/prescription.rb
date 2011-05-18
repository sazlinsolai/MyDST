class Prescription < ActiveRecord::Base

  belongs_to :dispenses
  belongs_to :patients

  # constructing the JSON structure for prescription model
  def as_json(options={})
    {:id => id, :name => name}
  end
  
end
