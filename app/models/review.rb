class Review <ActiveRecord::Base
    belongs_to :user
    belongs_to :game

    def print_detail
        "#{user.username} gives #{game.name} #{rating} stars: #{content}"
    end
end