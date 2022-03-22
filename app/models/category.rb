class Category < ActiveRecord::Base
    has_many :games

    def platforms
        games.pluck(:platform)
    end

    def self.highest_rated
        self.all.max_by {|c| c.games.length} #TODO: check this
    end
end