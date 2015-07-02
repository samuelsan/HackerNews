require 'rubygems'
require 'nokogiri'
require 'open-uri'
require './post.rb'
require './comment.rb'
require 'pry'
require 'colorize'

url = ARGV[0]
doc = Nokogiri::HTML(open(url)) 


post = Post.new(doc)
puts "Post title: #{post.title}".colorize(:magenta)
puts "Post date: #{post.date}".colorize(:red)
puts "Points: #{post.points}".colorize(:blue)
puts "Post id: #{post.id}".colorize(:cyan)
puts "Number of comments: #{post.comment.length}".colorize(:green)

