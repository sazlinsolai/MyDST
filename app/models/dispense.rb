class Dispense < ActiveRecord::Base

  belongs_to :prescription

  scope :have_dispense, lambda{ |prescription_id| {:conditions => ["prescription_id =? AND date_of_dispense =?", prescription_id, Time.zone.now.to_date]}}
  
end
