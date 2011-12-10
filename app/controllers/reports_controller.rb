
require 'csv'
class ReportsController < ApplicationController
  
  ADULT_AGE = 16
  
  respond_to :html,:json,:xml
  def index
    @count = Integer(params[:count])  rescue nil
    @count ||= 8
    @count = 8 unless (1..Person.count).member? @count
    @category = params[:category]
    @category ||= :all
    @year = Integer(params[:year]) rescue nil
    @year ||= Time.now.year
    persons = Person.includes(:results => :klass)
    be_come_adult = (Time.local(@year) - ADULT_AGE.years ).to_date
    persons = persons.where("birthdate < ?",be_come_adult) if @category == "adult"
    persons = persons.where("birthdate >= ?",be_come_adult) if @category == "teen"
    persons = persons.sort_by do |p| -p.season_points end

    @years = ((Competition.order("date").first.date.year rescue 1.year.ago.year)..1.year.from_now.year).to_a
    
    @years.map! do |a|
      [a,a]
    end
    
    @categories = [['Alla',:all],['Ungdomar',:teen],['Vuxen',:adult]]
    
    hash_cats = @categories.inject({}) do |result, element|
      result[element.last] = element.first
      result
    end
    @chosen_category_name = hash_cats[@category.to_sym]
    
    valid_comps = Result.joins(:competition).
      where("date BETWEEN ? AND ?", Time.local(@year ).to_date, Time.local(@year + 1).to_date).
      select("results.competition_id").group("results.competition_id")
    @competitions = Competition.
      includes(:results => :klass).order("date").
      where("competitions.competition_id IN (#{valid_comps.to_sql})")
    hash = {}
    persons.each do |p| 
      hash[p.person_id] = {
        :name => p.full_name, 
        :results => Array.new(@competitions.length,0),
        :data => Array.new(@competitions.length,nil)
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
    @report.sort_by! do |e|
      v = e[:data].last
      v = v.nil? ? 0 : v     
      -v
    end
    @diagram_report = @report[0..(@count -1)]
    
    if params[:csv]
      csv_string = CSV.generate :col_sep => ";", :row_sep => "\r\n" do |csv|
        csv << ["Namn","Total"]
        @report.each do |d|
          #arr = Person.find_by_person_id(d[:id]).results.joins(:competition).order("competitions.date").map(&:points)
          csv << [ Iconv.conv("ISO-8859-1", "UTF-8", d[:name]), d[:data].last]
        end
      end
      send_data csv_string, :filename => "#{@year} #{@chosen_category_name} #{Time.now.to_date}.csv"
    end

  end
  
  private 
  
  def calculate_season_points a
    s = a.sort_by do |e| -e end[0..5].sum rescue a.sum
    s == 0 ? nil : s
  end
end
