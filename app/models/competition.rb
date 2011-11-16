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

=begin
  def self.delayed_import
    GirlFriday::WorkQueue.new('competitions', :error_handler => ErrorHandler) do
      import
    end
  end
=end
  
  def self.import
    Eventor.import('events')[:event_list][:event].each do |e|
      create(
        :competition_id =>  e[:event_id],
        :name => e[:name],
        :date => e[:start_date][:date],
        :url =>  e[:web_url],
        :comment =>  e[:comment]
      )
    end
  end
  

  def eventor_url
    "http://eventor.orientering.se/Events/Show/#{competition_id}"
  end
end
