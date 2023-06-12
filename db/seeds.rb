# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require 'json'

  url = URI.open("https://tmdb.lewagon.com/movie/top_rated")
  file = File.read(url)
  json = JSON.parse(file)

  movies = json["results"].first(5)

  movies.each do |movie|
    movie_title = movie["original_title"]
    movie_poster = "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}"
    movie_rating = movie["vote_average"]
    movie_overview = movie["overview"]


    Movie.create(title: movie_title, poster_url: movie_poster, rating: movie_rating, overview: movie_overview)
  end
