class State < ActiveRecord::Base

  has_many :districts
  has_many :patients
end
