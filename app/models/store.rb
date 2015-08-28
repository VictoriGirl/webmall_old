# Store
class Store
  include Mongoid::Document

  field :name, type: String
  field :type, type: String
  field :date_of_opening, type: Date
  field :store_country, type: String
  field :store_city, type: String

  belongs_to :users
  has_many :goods
end
