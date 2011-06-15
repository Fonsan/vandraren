class ErrorHandler
  
  def handle(ex)
    Rails.logger.debug ex
  end
  
end