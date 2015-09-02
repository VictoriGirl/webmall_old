# Store
class Store
  GOOD_TYPES = { 'Товары' => 'goods', 'Услуги' => 'service' }

  include Mongoid::Document

  field :title, type: String
  index(title: 1)

  field :name, type: String
  field :speciality, type: String
  field :goods_type, type: String
  field :date_of_opening, type: Date
  field :store_country, type: String
  field :store_city, type: String

  field :last_buying_at, type: DateTime
  field :buying_count, type: Integer

  validates :title, :name, :speciality, :goods_type, :store_country, :store_city, presence: true
  validates :goods_type, inclusion: { in: %w(goods service) }
  validates :title, uniqueness: true

  belongs_to :user
  has_many :goods, dependent: :destroy
end
