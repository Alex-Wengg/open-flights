class Airline < ApplicationRecord
  has_many :reviews

  before_create :slugify

  def slugify
    self.sluge = name.downcase.gsub(' ', '-')
  end
end
