class Person < ActiveRecord::Base
  validates :person_id,:presence => true, :uniqueness => true
  validates :name,:presence => true
  validates :surname,:presence => true
  validates :birthdate,:presence => true

  has_many :results,:primary_key => :person_id, :foreign_key => :person_id

  default_scope order("surname,name")
  
  def season_points
    results.map(&:points).sum
  end
  
  def full_name
    "#{name} #{surname}"
  end

  def self.import
    list = Eventor.import("persons/organisations/203","PersonList")
    #debugger
    list.each do |p|
      n = p["Person_PersonName"]
      Person.create(
        :name => n["PersonName_Given"],
        :surname => n["PersonName_Family"],
        :person_id => p["Person_PersonId"],
        :birthdate => p["Person_BirthDate"]["BirthDate_Date"]
      )
      import_person(p["Person_PersonId"])
    end
  end
=begin
  def self.delayed_import_person
    @@p ||= GirlFriday::WorkQueue.new('person', :error_handler => ErrorHandler) do |id|
      import_person(id)
    end
  end
  def self.delayed_import
    @@plist ||= GirlFriday::WorkQueue.new('person_list', :error_handler => ErrorHandler) do
      import
    end
  end
=end

  def self.import_person id
    results = Result.count
    Eventor.import("results/person?personId=#{id}", "ResultListList").each do |n|

      c = n["ResultList_Event"]
      comp_id = c["Event_EventId"]
      if Competition.find_by_competition_id(comp_id).nil?
        Competition.create(:competition_id => comp_id,
          :name => c["Event_Name"],
          :comment => c["Event_Comment"],
          :date => c["Event_StartDate"]["StartDate_Date"],
          :url => c["Event_WebURL"]
        ) 
      end

      r = n["ResultList_ClassResult"]
      p = r["ClassResult_PersonResult"]["PersonResult_Person"]
      res = r["ClassResult_PersonResult"]["PersonResult_Result"]
      klass = r["ClassResult_EventClass"]

      kh ={
        :name => klass["EventClass_Name"],
        :short_name => klass["EventClass_ClassShortName"]
      }

      if !(kl = Klass.find_by_short_name(kh[:short_name]))
        kl = Klass.create(kh)
      end
      hash = {
        :competition_id => n["ResultList_Event"]["Event_EventId"],
        :person_id => p["Person_PersonId"],
        :position => res["Result_ResultPosition"],
        :time => res["Result_Time"],
        :time_diff => res["Result_TimeDiff"],
        :klass_id => kl.id
      }
      Result.create(hash)
      n
    end
    Result.count - results
  end

end
