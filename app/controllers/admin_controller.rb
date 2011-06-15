#coding: utf-8
class AdminController < ApplicationController
  before_filter :login_required
  def index
    @jobs = GirlFriday.status
  end

  def full_import
    #Competition.delayed_import.push(nil)
    Person.import
    redirect_to admin_index_path,
      :notice => 'Hämtning är färdig'
  end
  
  def clear_jobs
    redirect_to admin_index_path
  end
  
end
