# coding: utf-8
class XhrController < InheritedResources::Base
  
  before_filter :login_required
  respond_to :html, :xml, :json
  
  helper_method :sort_column, :sort_direction

  layout :xhr_layout
  
  
  def create  
    create! do |success, failure|
      success.html {render :nothing => true}
      
    end
  end
  
  def update
    update! do |success, failure|
      success.html {render :nothing => true}
      
    end
  end
  
  def collection
    @search ||= includes(end_of_association_chain.unscoped).search(params[:search])
    @pagination ||= @search.paginate(:page => params[:page], :per_page => 20)
  end
  
  def includes(ar)
    ar
  end
  
  private 
  def xhr_layout
    request.xhr? ? false : 'application'
  end
  
 
end
