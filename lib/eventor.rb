
require 'nokogiri'
require 'open-uri'
require 'ap'
class Nokogiri::XML::Node
  def to_hash
    if element_children.length < 1
      content
    else
      h={}
      element_children.each do |c|
        h["#{name}_#{c.name}"] =  c.to_hash
      end
      h
    end
  end
end

require 'net/http'

# Lengthen timeout in Net::HTTP
module Net
    class HTTP
        alias old_initialize initialize

        def initialize(*args)
            old_initialize(*args)
            @read_timeout = 5*60     # 3 minutes
        end
    end
end

module Eventor

  def self.import req, root, element ="*"
    res = []

    open "https://eventor.orientering.se/api/#{req}", "ApiKey" => EVENTOR_KEY, :read_timeout => 10*60 do |f|
      doc = Nokogiri::XML(f.read)
      res = doc.xpath("//#{root}/#{element}").map(&:to_hash)
    end
  
    res
  end
  
end