class Beer
    attr_accessor :id, :name, :style, :malts, :yeast, :ibu

    def initialize(hash_options)
        @id = hash_options["id"]
        @name = hash_options["name"]
        @style = hash_options["style"]
        @malts = hash_options["malts"]
        @yeast = hash_options["yeast"]
        @ibu = hash_options["ibu"]
    end

    def self.find(id)
        Beer.new(Unirest.get("#{ ENV["API_HOST"] }/api/v1/beers/#{ id }.json").body)
    end

    def self.all
        beer_hashes = Unirest.get("#{ ENV["API_HOST"] }/api/v1/beers.json").body
        beers = []
        beer_hashes.each do |beer_hash|
            beers << Beer.new(beer_hash)
        end
        beers
    end
end