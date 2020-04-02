class PlanetsCli::CLI

    def start
        puts "Welcome to a Galaxy Far, Far Away!"
        puts "To see take a tour of the Galaxy and visit different planets, enter 'planets'."
        puts "To make a jump into hyperspace and leave this universe, enter 'exit'."
        API.get_data
        menu
    end
    
    def menu
        input = gets.strip.downcase
        if input == "planets"
            planet_list
        elsif input == "exit"
            exit
        else 
            invalid
        end

    end

    def planet_list
        Planets.all.each_with_index do |planet, index|
            puts "#{index + 1}. #{planet.name}"
        end
        puts ""
        puts "Where would you like to go? Enter the planet name and engage the hyperdrive!"
        input = gets.strip.downcase

        planet_picker(input)

    end

    def planet_picker(planet)
        world = Planets.find_by_name(planet)
        world.each do |p|
            puts "Name: #{p.name}"
            puts "Diameter: #{p.diameter}"
            puts "Climate: #{p.climate}"
            puts "Terrain: #{p.terrain}"
            puts "Population: #{p.population}"
        end
        puts ""
        puts ""
        puts "If you would like to see more of the Galaxy, enter 'planets'."
        puts "Otherwise, please enter 'exit' to blast off into the Outer Rim and close the program."
        menu



    end


    def exit
        puts "Goodbye and May the Force be with You Always!"
    end

    def invalid
        puts "Whoops! Looks like that's not an option, please try again."
        menu
    end



end
