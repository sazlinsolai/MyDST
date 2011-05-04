module PatientsHelper


  def patient_country(p)
    Patient::NEGERI[p]
  end

  def patient_district(p)
    Patient::DAERAH[p]
  end

end
