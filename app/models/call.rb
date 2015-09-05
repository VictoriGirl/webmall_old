# Call
class Call
  STATUSES = { 'Новая заявка' => 'new', 'В работе' => 'executing', 'Исполнено' => 'done', 'Отменено' => 'cancelled' }
  CURRENCIES = { 'Руб.' => 'RUB', '$' => 'USD', 'Евро' => 'EUR' }

  include Mongoid::Document

  field :status, type: String
  field :done_date, type: DateTime

  field :buying_price, type: Float
  field :buying_currency, type: String
  field :count, type: Integer
  
  validates :status, inclusion: { in: %w(new executing done cancelled) }
  validates :buying_currency, inclusion: { in: %w(RUB USD EUR) }

  validates_associated :basket

  belongs_to :good
  belongs_to :service
  belongs_to :basket
end
