class ResultsController < XhrController
  def includes(ar)
    Result.joins(:competition,:klass,:person)
  end
end