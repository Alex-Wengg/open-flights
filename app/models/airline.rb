class Airline < ApplicationRecord
  has_many :reviews

  before_create :slugify

  def slugify
    self.sluge = name.downcase.gsub(' ', '-')
  end


  def avg_score

    return 0 unless reviews.count.positive?
    reviews.average(:score).round(2).to_f
  end
end
