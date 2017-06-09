class BeersController < ApplicationController
    def index
        @beers = Beer.all
    end

    def new
    end

    def create
        beer = Unirest.post(
                                "#{ ENV["API_HOST"] }/api/v1/beers.json",
                                headers: {
                                            "Accept" => "application/json"
                                        },
                                parameters: {
                                            name: params[:name],
                                            style: params[:style],
                                            ibu: params[:ibu]
                                        }
                                ).body
        redirect_to "/beers/#{beer["id"]}"
    end

    def show
        @beer = Beer.find(params[:id])
    end

    def destroy
        Unirest.delete( "#{ ENV["API_HOST"] }/api/v1/beers.json",
                        headers: { "Accept" => "application/json"},

                         )
        redirect_to '/beers'
    end
end
