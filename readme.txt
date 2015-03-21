http://en.wikipedia.org/wiki/List_of_countries_and_dependencies_by_population

Start by making a new project with a Rakefile (no Rails!)

We will pretend that the list/table might be changing all the time, so we want something repeatable to extract the text data from it

Write Rake tasks to download the HTML, extract the list of countries by population, and generate both JSON and CSV files.

No backend stuff, no browser stuff. Just a pure Ruby command line script.

The extra challenge is to scrape a separate table and merge the ISO country codes to each item

http://en.wikipedia.org/wiki/ISO_3166-1

I recommend using Nokogiri rather than regexes or anything crazy to parse the text.

http://www.nokogiri.org/tutorials/parsing_an_html_xml_document.html
