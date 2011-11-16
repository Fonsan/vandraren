
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

module NokogiriUtils
  extend self

  # http://gist.github.com/370755
  def hash_from_node(node)
    { node.root.name.underscore.to_sym => xml_node_to_hash(node.root) }
  end

  def xml_node_to_hash(node)
    return to_value(node.content.to_s) unless node.element?

    result_hash = {}

    node.attributes.each do |key, attr|
      ( result_hash[:attrs] ||= Hash.new )[attr.name.underscore.to_sym] = to_value(attr.value)
    end

    node.children.each do |child|
      result = xml_node_to_hash(child)

      if child.name == "text"
        return to_value(result) unless child.next_sibling || child.previous_sibling
      else
        key, val = child.name.underscore.to_sym, to_value(result)
        curr = result_hash[key]
        if curr
          if curr.is_a?(Array)
            curr.push(val)
          else
            result_hash[key] = [curr, val]
          end
        else
          result_hash[key] = val
        end
      end
    end

    result_hash
  end

  def to_value(data)
    data.is_a?(String) && data =~ /^\d+$/ ? data.to_i : data
  end

end

module Eventor

  def self.import req
    res = []
    open "https://eventor.orientering.se/api/#{req}", "ApiKey" => EVENTOR_KEY, :read_timeout => 10*60 do |f|
      doc = Nokogiri::XML(f.read)
      res = NokogiriUtils::hash_from_node(doc)
    end
    res
  end
  
end