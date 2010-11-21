
require 'csv'
class ReportsController < ApplicationController
  
  respond_to :html,:json,:xml
  def index
    
    
    @start_date = params[:start]
    @end_date = params[:end]
    @start_date ||= 1.year.ago.to_date
    @end_date ||= Time.now.to_date
    persons = Person.includes(:results => :klass)
    persons = persons.sort_by do |p| -p.season_points end
    #persons = persons[0..7]
    
    @competitions = Competition.
      where("competitions.competition_id = results.competition_id AND date BETWEEN ? AND ?",@start_date, @end_date).
      includes(:results => :klass).order("date").
      where("competitions.competition_id IN (#{Result.select("competition_id").group("competition_id").to_sql})")
    hash = {}
    persons.each do |p| 
      hash[p.person_id] = {
        :name => p.full_name, 
        :results => Array.new(@competitions.length,0),
        :data => Array.new(@competitions.length,0)
      }
    end
    
    @competitions.each_with_index do |c,i|
      c.results.each do |r|
        hash[r.person_id][:results][i] = r.points if hash[r.person_id]
      end
    end
    hash.each do |k,v|
      a = v[:results]
      p = v[:data]
      a.each_with_index do |e,i|
        p[i] = calculate_season_points(a[0..i])
       
      end
    end
    
    @report = []
    hash.keys.each do |k|
      r =  hash[k]
      r[:id] = k
      @report << r
    end
    @diagram_report = @report[0..7]
    
    if params[:csv]
      csv_string = CSV.generate :col_sep => ";", :row_sep => "\r\n" do |csv|
        csv << ["Namn","Total"]
        @report.each do |d|
          #arr = Person.find_by_person_id(d[:id]).results.joins(:competition).order("competitions.date").map(&:points)
          csv << [ Iconv.conv("ISO-8859-1", "UTF-8", d[:name]), d[:data].last]
        end
      end
      send_data csv_string, :filename => "#{@start_date} #{@end_date}.csv"
    end

  end
  
  private 
  
  def calculate_season_points a
    a.sort_by do |a| -a end[0..5].sum rescue a.sum
  end
end
