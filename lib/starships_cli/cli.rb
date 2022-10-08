class CLI 

    def start 
        puts "Welcome to the Starship Lot, shopping for a new starship?"
        puts "Let's start with your name:"
        API.get_data
        greet(user_input)
    end  

    def user_input 
        gets.strip 
    end 

    def greet(name)
        puts "Awesome #{name}, would you like to see our starships?"
        puts "Input 'y' to see the list, 'exit' to leave the lot!"
        menu
    end 

    def continue
        puts "Do you want to continue? Input 'y' to see the list, exit to leave the lot!"
    end

    
    def starships_list 
        Starship.all.each.with_index(1) do |starship, i|
            
            puts "" 
            puts "#{i}. #{starship.name}"
            puts ""
            
        end 
        starship_selection
    end 

    def goodbye
        puts "Hopefully you'll come back! But bye for now!" 
        exit
    end 

    def invalid 
        puts "Hmm, that doesnt seem valid, try again?"
        menu
    end 

    def starship_selection
        puts "Select a starship for more detail"

        selection = user_input 
        starship = Starship.find_starship(selection)
        starship_details(starship)
        
    end 

    def starship_details(starship)
        puts ""
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Name: #{starship.name}"
        puts "Model: #{starship.model}"
        puts "Manufacturer: #{starship.manufacturer}"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        continue
        menu
    end 


    def menu 
        selection = user_input 

        if selection == 'y' 
            starships_list
            menu

        elsif selection == 'exit'
            goodbye
        else 
            invalid
        end 

    end 

end 