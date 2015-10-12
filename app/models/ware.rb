# Ware
class Ware
  UNITS = { 'Шт' => 'pc', 'Кг' => 'kg', 'г' => 'g', 'Л' => 'l' }
  CURRENCIES = { 'Руб' => 'RUB', '$' => 'USD', 'Евро' => 'EUR' }

  include Mongoid::Document
  include Mongoid::Search

  field :name, type: String
  field :category, type: String
  field :description, type: String
  field :ware_type, type: String

  field :currency, type: String
  field :unit, type: String

  field :keywords, type: Array

  field :last_buying_date, type: DateTime
  field :buying_count, type: Integer

  validates :name, :category, presence: true
  validates :currency, inclusion: { in: %w(RUB USD EUR) }, allow_blank: false
  validates :unit, inclusion: { in: %w(pc kg g l) }, allow_blank: false, if: :goods?
  validates :unit, inclusion: { in: %w(pc kg g l) }, allow_blank: true

  validates_associated :store

  belongs_to :store
  has_many :ware_storages, dependent: :destroy
  has_many :calls

  search_in :name, :category, :description, :keywords, store: [:name, :speciality, :ware_type]

  def goods?
    :ware_type == 'goods'
  end
end
