
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
module Eventor

  def self.import req, root, element ="*"
    res = []

    open "https://eventor.orientering.se/api/#{req}", "ApiKey" => 'b320f2a56430481ca05a8b493880535e' do |f|
      doc = Nokogiri::XML(f.gets)
      res = doc.xpath("//#{root}/#{element}").map(&:to_hash)
    end
  
    res
  end
  
end