class Movie < ActiveRecord::Base
  def all_ratings
    puts self.select(:rating).uniq
  end
end
