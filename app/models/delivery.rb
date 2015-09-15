# Delivery
class Delivery
  include Mongoid::Document

  TYPES = { 'Курьером' => 'courier', 'Самовывоз' => 'self', 'Почтой' => 'mail' }

  field :type, type: String
  field :description, type: String

  validates :type, :description, presence: true
  validates :type, inclusion: { in: %w(courier self mail) }

  embedded_in :pop
end
