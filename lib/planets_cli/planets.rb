class Planets
    attr_accessor :name, :diameter, :climate, :terrain, :population
    @@all = []

    def initialize(attributes)
        attributes.each do |k, v|
            self.send("#{k}=", v) if self.respond_to?("#{k}=")
        end
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.select do |planet|
            planet.name.downcase == name
        end
    end




end
