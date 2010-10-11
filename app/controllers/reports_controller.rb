
class ReportsController < ApplicationController
  respond_to :html,:json,:xml
  def index
    persons = Person.includes(:results => :klass)
    persons = persons.sort_by do |p| -p.season_points end
    persons = persons[0..7]
    
    @competitions = Competition.includes(:results => :klass).order("date")
    hash = {}
    persons.each do |p| 
      hash[p.person_id] = {
        :name => p.full_name, 
        :data => Array.new(@competitions.length,0)
      }
    end
    
    @competitions.each_with_index do |c,i|
      c.results.each do |r|
        hash[r.person_id][:data][i] = r.points if hash[r.person_id]
      end
    end
    hash.each do |k,v|
      a = v[:data]
      a.each_with_index do |e,i|
        a[i] = e + (a[i-1] rescue 0)
        #TODO
        # calculate_season_points(a[0..i]) 
      end
    end
    
    @report = []
    hash.keys.each do |k|
      @report << hash[k]
    end
  end

end
