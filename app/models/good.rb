# Good
class Good
  UNITS = { 'Шт' => 'pc', 'Кг' => 'kg', 'Л' => 'l' }
  CURRENCIES = { 'Руб.' => 'RUB', '$' => 'USD', 'Евро' => 'EUR' }

  include Mongoid::Document
  include Mongoid::Search

  field :name, type: String
  field :category, type: String
  field :description, type: String

  field :count, type: Integer
  field :unit, type: String
  field :price, type: Float
  field :currency, type: String

  field :keywords, type: Array

  field :last_buying_date, type: DateTime
  field :count_buying, type: Integer

  validates :name, :category, :unit, presence: true
  validates :currency, inclusion: { in: %w(RUB USD EUR) }

  belongs_to :store
  has_many :calls

  search_in :name, :category, :description, :keywords, store: [:name, :speciality]
end
