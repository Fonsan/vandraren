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
    list = Eventor.import("persons/organisations/203")[:person_list][:person]

    list.each do |p|
      n = p[:person_name]
      Person.create(
        :name => n[:given],
        :surname => n[:family],
        :person_id => p[:person_id],
        :birthdate => p[:birth_date][:date]
      )
      import_person(p[:person_id])
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
    results_count = Result.count
    puts id
    results = Eventor.import("results/person?personId=#{id}")[:result_list_list]
    return unless results[:result_list]
    curr = nil
    results[:result_list].each do |n|
      if n.is_a?(Hash)
        curr = n
        event = n[:event]
        comp_id = event[:event_id]
        if Competition.find_by_competition_id(comp_id).nil?
          Competition.create(:competition_id => comp_id,
            :name => event[:name],
            :comment => event[:comment],
            :date => event[:start_date][:date],
            :url => event[:web_url]
          ) 
        end

        r = n[:class_result]
        pr = r[:person_result]
        p = pr[:person]

        klass = r[:event_class]

        kh ={
          :name => klass[:name],
          :short_name => klass[:class_short_name]
        }
        if !(kl = Klass.find_by_short_name(kh[:short_name]))
          kl = Klass.create(kh)
        end      
        races = []
        if pr[:race_result]
          if pr[:race_result].is_a?(Array)
            pr[:race_result]
          elsif pr[:race_result][:event_race]
            races << pr[:race_result][:event_race]
          end
        end
        races << pr[:result] if pr[:result]
        races.each do |res| 
          hash = {
            :competition_id => n[:event][:event_id],
            :person_id => p[:person_id],
            :position => res[:result_position],
            :time => res[:time],
            :time_diff => res[:time_diff],
            :klass_id => kl.id
          }
          Result.create(hash)
        end
      end
    end
    Result.count - results_count
  rescue
    ap curr
    raise
  end

end
