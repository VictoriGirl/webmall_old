# WareStorage
class WareStorage
  UNITS = { 'Шт' => 'pc', 'Кг' => 'kg', 'г' => 'g', 'Л' => 'l' }
  CURRENCIES = { 'Руб.' => 'RUB', '$' => 'USD', 'Евро' => 'EUR' }

  include Mongoid::Document

  field :price, type: Float
  field :currency, type: String

  field :count, type: Integer
  field :unit, type: String
  field :in_sight, type: Boolean

  validates :currency, inclusion: { in: %w(RUB USD EUR) }, allow_blank: true
  validates :unit, inclusion: { in: %w(pc kg g l) }, allow_blank: true
  validates_associated :pop, :ware

  belongs_to :pop
  belongs_to :ware
  belongs_to :store
end
