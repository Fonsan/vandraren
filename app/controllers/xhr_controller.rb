# coding: utf-8
class XhrController < InheritedResources::Base
  respond_to :html, :xml, :json
  
  helper_method :sort_column, :sort_direction

  layout :xhr_layout
  
  
  def create
    create!{ render :nothing => true}
  end
  
  def update
    update!{ render :nothing => true}
  end
  
  def collection
    @preload_collection ||= includes(end_of_association_chain.unscoped).
      order(order).paginate(:page => params[:page], :per_page => 12)
  end
  
  def includes(ar)
    ar
  end
  
  private 
  def xhr_layout
    request.xhr? ? false : 'application'
  end
  
  def order
    
    if request.xhr? 
      hash = params.reject do |k,v| !["page","sort","direction"].include?(k) end
      session[controller_name + "order"] = hash
    else
      begin
        params.merge! session[controller_name + "order"]
      rescue
      end
    end
    Rails.logger.add 1, params
    sort_column.split(",").join( " #{sort_direction},") + " " + sort_direction
  end
  
  def sorts
    ["competitions.name","competitions.date","people.surname,people.name",'position','time','time_diff']
  end
  
  def sort_column
    sort = (sorts + ["id","created_at","updated_at"]).include?(params[:sort]) ? params[:sort] : resource_class.column_names.first rescue "id"
    Rails.logger.add 1, sort
    sort
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
