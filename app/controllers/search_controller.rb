class SearchController < ApplicationController

  def search
  end

  def originAirport
    # sets cookies location to input from user on form
    cookies[:location]=params[:selected_value]
    @location = cookies[:location]
    @response = HTTParty.post "http://iatacodes.org/api/v6/autocomplete?api_key=f58b75d0-0d50-4573-8679-ea04f28ee818&query=#{@location}"

    @parse = JSON.parse(@response.body)

    @airports = @parse["response"]["airports"]

    render :json => @airports
  end

  def desAirport
    # sets cookies location to input from user on form
    cookies[:location]=params[:selected_value]
    @location = cookies[:location]
    @response = HTTParty.post "http://iatacodes.org/api/v6/autocomplete?api_key=f58b75d0-0d50-4573-8679-ea04f28ee818&query=#{@location}"

    @parse = JSON.parse(@response.body)

    @airports = @parse["response"]["airports"]

    render :json => @airports
  end

  def results

  end
end
