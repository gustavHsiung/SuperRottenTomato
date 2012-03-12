class Movie < ActiveRecord::Base
  def self.all_ratings
    puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>'
    puts self.select(:rating).uniq
  end
end
