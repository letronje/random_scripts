#! /usr/bin/env ruby

require 'rubygems'
require 'mechanize'

#Based on http://log.javaheadbrain.com/2012/01/how-to-download-videos-from-infoq-for.html
mechanize_agent = Mechanize.new{ |agent|
  agent.user_agent_alias = 'iPhone'
}

puts "\nMasquerading as iPhone ...\n"

page = mechanize_agent.get(ARGV.first)

puts "\nFetched page content ...\n"

video_url = page.at("//*[@id='video']/source")['src']

puts "\nVideo URL => #{video_url}\n"

puts "\nDownloading with wget ... \n\n"

system("wget -c '#{video_url}'")
