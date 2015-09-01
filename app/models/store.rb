# Store
class Store
  include Mongoid::Document

  field :title, type: String

  field :name, type: String
  field :speciality, type: String
  field :goods_type, type: String
  field :date_of_opening, type: Date
  field :store_country, type: String
  field :store_city, type: String

  field :last_buying_at, type: DateTime
  field :buying_count, type: Integer

  validates :title, :name, :speciality, :goods_type, :store_country, :store_city, presence: true
  validates :title, uniqueness: true, unless: 'title.nil?'

  belongs_to :user
  has_many :goods, dependent: :destroy
end
