# Profile
class Profile
  include Mongoid::Document

  field :first_name, type: String
  field :last_name, type: String
  field :date_of_birth, type: Date

  # for sailer
  field :company, type: String
  field :free, type: Boolean

  # for client
  field :phone_number, type: String
  field :country, type: String
  field :city, type: String
  field :adress, type: String

  validates :first_name, presence: true, unless: :new_record?
  validates :phone_number, length: { is: 11 }, allow_nil: true

  embedded_in :users
end
