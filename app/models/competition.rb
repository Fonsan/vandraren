class Competition < ActiveRecord::Base
  validates :competition_id,:presence => true, :uniqueness => true
  validates :name,:presence => true
  validates :date,:presence => true
  #validates :url,:presence => true

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
