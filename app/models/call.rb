# Call
class Call
  STATUSES = { 'Новая заявка' => 'new', 'В работе' => 'executing', 'Исполнено' => 'done', 'Отменено' => 'cancelled' }

  include Mongoid::Document

  field :status, type: String
  field :call_date, type: DateTime
  field :done_date, type: DateTime

  validates :status, inclusion: { in: %w(new executing done cancelled) }

  has_one :good
  has_one :service
  has_one :user
end
