require 'nokogiri'
require 'open-uri'

class Scraper
  def self.scrape(url)
    doc = Nokogiri::HTML(URI.open(url))
    {
      url: url,
      dish_name: doc.css('h1').first&.text&.strip,
      ingredients: doc.css('.ingredients li').map(&:text).join("\n"),
      directions: doc.css('.directions li').map(&:text).join("\n")
    }
  end
end
