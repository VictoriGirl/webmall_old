class City
  include Mongoid::Document
  field :name, type: String
  field :country_id, type: Integer
end
