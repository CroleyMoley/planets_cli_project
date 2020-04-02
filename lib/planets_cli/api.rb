class API

    def self.get_data
        response = RestClient.get("https://swapi.co/api/planets/?page=2")
        planet_array = JSON.parse(response.body)["results"]
        planet_array.each do |planet|
            Planets.new(planet)
        end
    end


end
