class DispenseProfile < ActiveRecord::Base

  belongs_to :prescription

  scope :dispensing_day, lambda {|prescription_id| {:conditions => ["prescription_id =? AND day_name =?", prescription_id, Time.zone.now.to_date.strftime('%A').downcase]}}

end
