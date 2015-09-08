# Store
class Store
  WARE_TYPES = { 'Товары' => 'goods', 'Услуги' => 'service' }

  include Mongoid::Document
  include Mongoid::Search

  field :title, type: String
  index(title: 1)

  field :name, type: String
  field :speciality, type: String
  field :ware_type, type: String
  field :date_of_opening, type: Date
  field :store_country, type: String
  field :store_city, type: String

  field :last_buying_date, type: DateTime
  field :buying_count, type: Integer

  validates :title, :name, :speciality, :ware_type, :store_country, :store_city, presence: true
  validates :ware_type, inclusion: { in: %w(goods service) }
  validates :title, uniqueness: true, format: { with: /\A^[a-z0-9_-]{3,16}$*\z/ }

  validates_associated :user

  belongs_to :user
  has_many :wares, dependent: :destroy

  search_in :name, :speciality, :ware_type, :title

  def goods
    wares.where(ware_type: 'goods')
  end

  def services
    wares.where(ware_type: 'service')
  end
end
