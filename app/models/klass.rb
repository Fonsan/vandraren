class Klass < ActiveRecord::Base
  validates :name,:presence => true
  validates :short_name,:presence => true, :uniqueness => true
  
  default_scope order("name") 
end
