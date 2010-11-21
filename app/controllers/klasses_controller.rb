class KlassesController < XhrController
  def sorts
    ["name","short_name","main_class"]
  end
  
  def includes(ar)
    ar.order("name")
  end
end
