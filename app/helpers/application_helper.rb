module ApplicationHelper

  #Helper for Date of Birth on profile page
  def getBirthDateStart()
    Time.now.year - 70
  end

  def getBirthDateEnd()
    Time.now.year
  end
  
end
