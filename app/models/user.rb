class User < ActiveRecord::Base
    has_many :reviews
    has_many :games, through: :reviews

    def write_review(game, content, rating)
        reviews.create(content: content, rating: rating, game:game)
    end

    def self.most_reviews
        self.all.max_by {|u| u.reviews.length}
    end
end