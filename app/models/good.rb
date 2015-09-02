# Good
class Good
  UNITS = { 'Шт' => 'pc', 'Кг' => 'kg', 'Л' => 'l' }
  CURRENCIES = { 'Руб.' => 'RUB', '$' => 'USD', 'Евро' => 'EUR' }

  include Mongoid::Document

  field :name, type: String
  field :category, type: String
  field :description, type: String

  field :count, type: Integer
  field :unit, type: String
  field :price, type: Float
  field :currency, type: String

  field :last_buying_date, type: DateTime

  validates :name, :category, :unit, presence: true
  validates :currency, inclusion: { in: %w(RUB USD EUR) }

  belongs_to :store
  has_many :calls
end
