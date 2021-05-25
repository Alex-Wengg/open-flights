class AirlineSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :image_url, :sluge, :avg_score
  has_many :reviews
end
