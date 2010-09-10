# To change this template, choose Tools | Templates
# and open the template in the editor.

class XhrController < InheritedResources::Base
  respond_to :html, :xml, :json

  layout :xhr_layout
  
  def collection
    end_of_association_chain.paginate(:page => params[:page], :per_page => 15)
  end
  
  private 
  def xhr_layout
    request.xhr? ? false : 'application'
  end

end
