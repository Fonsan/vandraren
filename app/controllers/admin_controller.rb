#coding: utf-8
class AdminController < ApplicationController
  before_filter :login_required
  def index
    @jobs = Delayed::Job.order("created_at")
  end
  
  def jobs
    render :layout => false,:text => Delayed::Job.count
  end

  def full_import
    
    jobs = Delayed::Job.count
    Competition.delay.import
    Person.import
    redirect_to admin_index_path,
      :notice => "Lade till #{Delayed::Job.count - jobs} nya jobb"
  end
  
  def clear_jobs
    redirect_to admin_index_path,
      :notice => "Tog bort #{Delayed::Job.delete_all} jobb"
  end
  
end
