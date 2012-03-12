class Movie < ActiveRecord::Base
  def self.all_ratings
    puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>'
    all_rating_group = self.select(:rating).group(:rating).collect{|r| r.rating}
    puts all_rating_group
    puts '<<<<<<<<<<<<<<<<<<<<<<<<<<<'
    end
end
