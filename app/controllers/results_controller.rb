class ResultsController < XhrController
  def includes(ar)
    ar.includes(:competition,:klass,:person)
  end
end