
class ReportsController < ApplicationController
  def index
    persons = Person.all
    @persons = persons.map do |p|
      {
        :name => p.full_name,
        :data => p.results.map(&:points),
        :sum => p.results.map(&:points).sum
      }
    end
  end

end
