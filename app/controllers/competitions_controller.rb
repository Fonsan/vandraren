class CompetitionsController < XhrController
  
 
  def sorts
    ["name","comment","url","date"]
  end
 
  def select
    @competitions = Competition.where(:date => params[:date]).order("name")
  end
  
  def per_month
    month = Time.parse("#{params[:year]}-#{params[:month]}-01")
    @competitions = Competition.where("date >= ? AND date <= ?",month, month + 1.month).order("date,name")
    @competitions = @competitions.map do |c| c.date.day end.uniq
    respond_with(@competitions)
  end
end
