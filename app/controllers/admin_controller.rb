#coding: utf-8
class AdminController < ApplicationController
  before_filter :login_required
  def index
    @jobs = Delayed::Job
  end

  def full_import
    
    Competition.delay.import
    jobs = Delayed::Job.count
    Person.import
    redirect_to admin_index_path,
      :notice => "Lade till #{Delayed::Job.count - jobs} nya jobb"
  end
  
  def clear_jobs
    redirect_to admin_index_path,
      :notice => "Tog bort #{Delayed::Job.delete_all} jobb"
  end
  
end
