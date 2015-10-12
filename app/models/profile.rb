# Profile
class Profile
  include Mongoid::Document

  before_save :default_values

  field :first_name, type: String
  field :last_name, type: String
  field :date_of_birth, type: Date
  field :phone_number, type: String
  field :country, type: String
  field :city, type: String
  field :adress, type: String

  # for sailer
  field :company, type: String
  field :free, type: Boolean

  validates :first_name, presence: true, unless: :new_record?
  validates :phone_number, length: { is: 11 }, allow_blank: true

  embedded_in :users

  def default_values
    self.free ||= true
  end
end
