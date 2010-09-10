class Competition < ActiveRecord::Base
  validates :competition_id,:presence => true, :uniqueness => true
  validates :name,:presence => true
  validates :date,:presence => true
  validates :url,:presence => true

  has_many :results,:primary_key => :competition_id, :foreign_key => :competition_id

  def eventor_url
    "http://eventor.orientering.se/Events/Show/#{competition_id}"
  end
end
