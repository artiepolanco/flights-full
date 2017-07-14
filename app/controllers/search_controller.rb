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

    # @origin = params[:origin__location]

    @origin = params[:origin]


    @response = HTTParty.post "https://www.googleapis.com/qpxExpress/v1/trips/search?key=AIzaSyBCXBeNdsMW8LXoymASwa2JD0O2V_X6KQI&fields=trips(tripOption/pricing/saleTotal),trips(data/carrier/name), trips(tripOption/slice/duration)",
                          {:body => {
                            request: {
                              passengers: {
                                adultCount: "1"
                              },
                              slice: [
                                {
                                  origin: "#{params[:search][:origin__location]}",
                                  destination: "#{params[:search][:destination__location]}",
                                  date: "#{params[:search][:date]}"
                                }
                              ],
                              solutions: "10"
                            }
                          }.to_json,
                          :headers => { 'Content-Type' => 'application/json' } }

    # parse the json response body to ruby hash
    @parse = JSON.parse(@response.body)

    # isolate airline names and flight info into arrays
    @airlines = @parse["trips"]["data"]["carrier"]
    @flights = @parse["trips"]["tripOption"]

    @als = []
    @airlines.each do |airline|
      @als << {airline: airline["name"]}
    end

# looping through results to extract different flight info
    @flights.each_with_index do |flight, index|
      # time returned in minutes, changed to seconds here and formatted to hours and minutes
      total_seconds = flight["slice"][0]["duration"] * 60
      duration = Time.at(total_seconds).utc.strftime("%H:%M")

      price = flight["pricing"][0]["saleTotal"]

      if @als[index]
        @als[index][:duration] =  duration
        @als[index][:price] = price
      else
        @als << {:duration => duration,
            :price => price}
          end
        end

  end
end
