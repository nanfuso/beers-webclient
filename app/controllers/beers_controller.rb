class BeersController < ApplicationController
    def index
        @beers = Unirest.get('localhost:3000/api/v1/beers.json').body
    end

    def new
    end

    def create
        beer = Unirest.post(
                                "localhost:3000/api/v1/beers.json?name=#{params[:name]}&style=#{params[:style]}&ibu=#{params[:ibu]}",
                                headers: {
                                            "Accept" => "application/json"
                                        }
                                ).body
        redirect_to "/beers/#{beer["id"]}"
    end

    def show
        @beer = Unirest.get("localhost:3000/api/v1/beers/#{params[:id]}.json").body
    end
end
