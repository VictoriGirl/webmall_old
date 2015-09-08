# Ware
class Ware
  UNITS = { 'Шт' => 'pc', 'Кг' => 'kg', 'г' => 'g', 'Л' => 'l' }
  CURRENCIES = { 'Руб.' => 'RUB', '$' => 'USD', 'Евро' => 'EUR' }

  include Mongoid::Document
  include Mongoid::Search

  field :name, type: String
  field :category, type: String
  field :description, type: String
  field :ware_type, type: String

  field :price, type: Float
  field :currency, type: String

  field :keywords, type: Array

  field :last_buying_date, type: DateTime
  field :buying_count, type: Integer

  # for goods
  field :count, type: Integer
  field :unit, type: String
  # for services
  field :in_sight, type: Boolean

  validates :name, :category, presence: true
  validates :unit, presence: true, if: :goods?
  validates :currency, inclusion: { in: %w(RUB USD EUR) }

  validates_associated :store

  belongs_to :store
  has_many :calls

  search_in :name, :category, :description, :keywords, store: [:name, :speciality, :ware_type]

  def goods?
    :ware_type == 'goods'
  end
end
