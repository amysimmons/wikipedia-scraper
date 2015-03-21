require 'rubygems'
require 'nokogiri' 
require 'open-uri' 
require 'json'
require 'csv'

class WikipediaScraper < Nokogiri::HTML::Document

  def self.scrape
    page = Nokogiri::HTML(open("http://en.wikipedia.org/wiki/List_of_countries_and_dependencies_by_population"))
    puts page.class   # => Nokogiri::HTML::Document

    rows = page.css('.wikitable tr') 

    populations = {}
    rows.each do |row|
       country = row.css('a[title]').text
       population = row.css('td:nth-child(3)').text
       populations[country] = population
    end
    populations
  end

  def to_json
  end

  def to_csv
  end

end

