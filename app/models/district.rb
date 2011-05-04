class District < ActiveRecord::Base

  belongs_to :state
  has_many :patients
end
