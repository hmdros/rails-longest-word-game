# frozen_string_literal: true

require 'open-uri'
require 'json'
# gamescontroller do the game on site
class GamesController < ApplicationController
  def new
    # @letters = ('a'..'z').to_a.sample(12)
    @letters = ['i', 't', 'h', 's', 'a']
  end

  def score
    @word_input = params[:word_input]
    url = open("https://wagon-dictionary.herokuapp.com/#{@word_input}")
    @json = JSON.parse(url.read)
    if (@word_input.split('') - params[:letters].split('')) == []
      word_valid?(@word_input)
    else
      @result = "Sorry but #{@word_input} can't be built out
      of #{params[:letters]}"
    end
  end

  def word_valid?(word_input)
    if @json['found'] == true
      pontuation
      @result = "Word '#{word_input}' exists!"
    else
      @result = "Sorry but '#{word_input}' does not seem to
      be a valid English word..."
    end
  end

  def pontuation
    @points = @word_input.size
    if session['round'] <= 4
      session['round'] += 1
    else
      session['round'] = 0
      session['points'] = 0
    end
    session['points'] += @points
  end
end
