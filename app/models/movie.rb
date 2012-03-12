class Movie < ActiveRecord::Base
  def self.all_ratings
    puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>'
    puts self.select(:rating).group(:rating).rating
    puts '<<<<<<<<<<<<<<<<<<<<<<<<<<<'
    end
end
