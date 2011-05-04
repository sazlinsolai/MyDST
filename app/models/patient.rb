class Patient < ActiveRecord::Base

  belongs_to :state
  belongs_to :district
  belongs_to :reference
  has_many :addictions
  has_many :detentions
  has_many :medicinal_histories
  has_many :relatives
  has_many :prescriptions

  DAERAH = {0 => "Kuala Terengganu", 1 => "Kuala Langat"}
  NEGERI = {0 => "Johor",1 => "Kedah",2=>"Kelantan",3=>"Melaka",
            4=>"Negeri Sembilan",5=>"Pahang",6=>"Perak",7=>"Perlis",
            8=>"Pulau Pinang",9=>"Sabah",10=>"Sarawak",
            11=>"Selangor",12=>"Terengganu",13=>"Kuala Lumpur"}


  mount_uploader :avatar, AvatarUploader
  
end
