class Movie < ActiveRecord::Base
  attr_accessible :title, :rating, :description, :release_date

  def self.ratings
    ['G','PG','PG-13','R','NC-17']
  end
end
