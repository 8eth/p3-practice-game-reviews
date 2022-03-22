class Game < ActiveRecord::Base
    belongs_to :category
    has_many :reviews
    has_many :users, through: :reviews

    def average_rating
        rating_list = reviews.pluck(:rating)
        average_rating = (rating_list.sum)/rating_list.length.to_f

        average_rating.nan? ? 'No ratings yet' : average_rating
    end

    def self.find_by_platform(platform)
        self.all.find_by(platform: platform)
    end
end