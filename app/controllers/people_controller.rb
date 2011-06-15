class PeopleController < XhrController
  
  def sorts
    ["surname,name","birthdate"]
  end
  
  def show
    @years = ['Alla'] + ((Competition.order("date").first.date.year rescue 1.year.ago.year)..1.year.from_now.year).to_a
    @results = resource.results.includes(:competition,:person,:klass).order("competitions.date")
    @year = Integer(params[:year]) rescue nil
    @results = @results.where("competitions.date BETWEEN ? AND ?", Time.local(@year ).to_date, Time.local(@year + 1).to_date) if @year
    @results = @results.all.sort_by do |r| -r.points end
    super
  end
  
end