class PeopleController < XhrController
  
  def sorts
    ["surname,name","birthdate"]
  end
end