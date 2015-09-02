# Profile
class Profile
  include Mongoid::Document

  field :first_name, type: String
  field :last_name, type: String
  field :date_of_birth, type: Date
  field :company, type: String

  validates :first_name, presence: true, unless: :new_record?

  embedded_in :users
end
