# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'net/http'
require 'json'

puts 'Deleting Movies...........'
Movie.destroy_all

puts 'Creating Movies.....'

url = URI('https://tmdb.lewagon.com/movie/top_rated')
movies_serialized = Net::HTTP.get(url)
movies = JSON.parse(movies_serialized)
movies['results'].each do |result|
  Movie.create!(title: result['title'], overview: result['overview'], poster_url: "https://image.tmdb.org/t/p/w500#{result['poster_path']}",
                rating: result['vote_average'])
end

puts 'Created!'
