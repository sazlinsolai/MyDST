class Prescription < ActiveRecord::Base

  belongs_to :dispenses
  belongs_to :patients

end
