require 'sinatra'
require 'pry'
require 'colorize'
require_relative 'card'
require_relative 'deck'
require_relative 'player'
require_relative 'game'

get '/' do
  haml :index
end



