# Call
class Call
  STATUSES = { 'Новая заявка' => 'new', 'В работе' => 'executing', 'Исполнено' => 'done', 'Отменено' => 'cancelled' }
  CURRENCIES = { 'Руб.' => 'RUB', '$' => 'USD', 'Евро' => 'EUR' }

  include Mongoid::Document

  field :status, type: String
  field :call_date, type: DateTime

  field :buying_price, type: Float
  field :buying_currency, type: String
  field :count, type: Integer

  field :name, type: String
  field :email, type: String
  field :phone_number, type: String
  field :country, type: String
  field :city, type: String
  field :adress, type: String

  validates :status, inclusion: { in: %w(new executing done cancelled) }
  validates :buying_currency, inclusion: { in: %w(RUB USD EUR) }

  belongs_to :ware
  belongs_to :user # for client
end
