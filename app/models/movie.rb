class Movie < ActiveRecord::Base
  def self.all_ratings
    self.select(:rating).group(:rating).collect{|r| r.rating}
  end
end
