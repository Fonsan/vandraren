class ApplicationController < ActionController::Base
  
  include Authentication
  #protect_from_forgery
  
  helper :all
end
