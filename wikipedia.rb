require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'csv'

class WikipediaScraper < Nokogiri::HTML::Document

  def self.scrape
    populationPage = Nokogiri::HTML(open("http://en.wikipedia.org/wiki/List_of_countries_and_dependencies_by_population"))
    populationRows = populationPage.css('.wikitable tr') 
    
    countryCodePage = Nokogiri::HTML(open("http://en.wikipedia.org/wiki/ISO_3166-1"))
    countryCodeRows = countryCodePage.css('.sortable tr')

    dataMain = {}
    populationRows.each do |row|
       country = row.css('a[title]').text
       population = row.css('td:nth-child(3)').text
       dataMain[country] = population
    end
    dataMain

    countryCodeData = {}
    countryCodeRows.each do |row|
      countryName = row.css('td:nth-child(1)').text
      iso = row.css('td:nth-child(5)').text
      countryCodeData[countryName] = iso
    end
    countryCodeData

    countryCodeData.each do |k, v|
      dataMain.each do |x, y|
        if k == x
          dataMain[x] = [y, v]
        end
      end
    end
    dataMain
  end

end


