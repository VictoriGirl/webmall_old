# Service
class Service
  CURRENCIES = { 'Руб.' => 'RUB', '$' => 'USD', 'Евро' => 'EUR' }

  include Mongoid::Document
  include Mongoid::Search

  field :name, type: String
  field :category, type: String
  field :description, type: String

  field :price, type: Float
  field :currency, type: String
  field :in_sight, type: Boolean

  field :keywords, type: Array

  field :last_buying_date, type: DateTime

  validates :name, :category, presence: true
  validates :currency, inclusion: { in: %w(RUB USD EUR) }

  validates_associated :store

  belongs_to :store
  has_many :calls

  search_in :name, :category, :description, :keywords, store: [:name, :speciality]
end
