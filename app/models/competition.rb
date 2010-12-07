class Competition < ActiveRecord::Base
  validates :competition_id,:uniqueness => true, :allow_nil => true
  validates :name,:presence => true
  validates :date,:presence => true
  #validates :url,:presence => true
  after_create do
    self.competition_id = id if competition_id == nil
    self.save!
  end
  
  
  has_many :results,:primary_key => :competition_id, :foreign_key => :competition_id
  
  def self.import
    Eventor.import('events','EventList').each do |e|
      create(
        :competition_id =>  e[ "Event_EventId"],
        :name => e["Event_Name"],
        :date => e["Event_StartDate"]["StartDate_Date"],
        :url =>  e["Event_WebURL"],
        :comment =>  e["Event_Comment"] 
      )
    end
  end
  

  def eventor_url
    "http://eventor.orientering.se/Events/Show/#{competition_id}"
  end
end
