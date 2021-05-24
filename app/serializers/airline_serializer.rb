class AirlineSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :image_url, :sluge
  has_many :reviews
end
