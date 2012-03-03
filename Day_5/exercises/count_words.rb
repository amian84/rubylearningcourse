# count_words.rb

word = ARGV[0] == nil ? 'the' : ARGV[0]
regex = /\b#{word}\b/i
url = 'http://satishtalim.github.com/webruby/chapter3.html'

require 'net/http'
puts "Searching for '#{word}' word using net/http library"
body = Net::HTTP.get(URI(url))
puts body.scan(regex).size

require 'open-uri'
puts "Searching for '#{word}' word using open-uri library"
f = open(url)
body = f.readlines.join
puts body.scan(regex).size

require 'open-uri'
require 'hpricot'
puts "Searching for '#{word}' word using Hpricot"
page = Hpricot(open(url))
puts page.inner_html.scan(regex).size

require 'nokogiri'
require 'open-uri'
puts "Searching for '#{word}' word using Nokogiri"
page = Nokogiri::HTML(open(url))
puts page.inner_html.scan(regex).size

