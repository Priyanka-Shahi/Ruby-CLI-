class API 


    def self.get_data
        response = RestClient.get('https://swapi.dev/api/starships/')
        starships_array = JSON.parse(response)["results"]
        starships_array.each do |starship|
            Starship.new(starship)
        end 
    end 

end