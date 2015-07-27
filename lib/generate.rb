#!/usr/bin/ruby

## This script reads all of the JSON quotes in the sources/ folder,
## and generates output in other formats.

require 'json'
require 'yaml'

# This class represents a single quotation.
class Quote

  ## Create a new Quote from a hash of attributes
  def initialize(hash)

    def add_tag(tag)
      if (tag.class == String)
        @data[:tags].push(tag.downcase)
      elsif not tag.nil?
        throw "Expected tag to be of type String but got #{tag} of type #{tag.class}."
      end
    end

    if hash.class != Hash
      throw "Expected argument of type Hash but got #{hash.class}"
    end

    @data = {}

    # We only want to read whitelisted string fields for safety purposes
    [:author, :quote, :source, :collection, :pages].each do |field|
      value = hash[field]
      if(value.nil?)
        value = hash[field.to_s]
      end

      if value.class == String
        @data[field] = value 
      elsif not value.nil?
        throw "Field \"#{field.to_s}\" should be a string, but got " +
              "#{hash[field]} of type #{hash[field].class}"
      end
    end

    @data[:tags] = []

    # Read tags, if present.  Either Arrays of Strings or Strings are ok.
    [:tag, :tags].each do |field|
      value = hash[field]
      if(value.nil?)
        value = hash[field.to_s]
      end

      if value.class == Array 
        value.each do |tag|
          add_tag(tag)
        end
      else
        add_tag(value)
      end
    end

  end

  def to_hash
    @data
  end

end

# Read in a collection of quotes from a file
def read_json_quotes(filename)
  file = File.read(filename)
  source_quotes = JSON.parse(file)
  result_quotes = []

  source_quotes.each do |quote_hash|
    quote_hash[:collection] = filename
    result_quotes.push(Quote.new(quote_hash)) 
  end

  result_quotes
end

# Read in a collection of quotes from a folder
def read_json_folder(folder)
  quotes = []
  files = Dir["#{folder}/*.json"]
  files.each do |file|
    puts "Reading file #{file}"
    quotes += read_json_quotes(file)
  end
  quotes
end

# Write quotes to JSON output file
def write_json_quotes(filename, quotes)
  opts = {
    :object_nl => "\n",
    :array_nl => "\n",
    :indent => "    ",
    :space => " ",
    :space_before => " "
  }

  File.write(filename, JSON.generate(quotes, opts))
end

def main
  quotes = read_json_folder("../sources")
  hashes = quotes.map { |quote| quote.to_hash }
  
  puts "Writing file ../quotes/all.json"
  write_json_quotes("../quotes/all.json", hashes)

  puts "Writing file ../quotes/all.yaml"
  File.write("../quotes/all.yaml", YAML.dump(hashes))
end

main
