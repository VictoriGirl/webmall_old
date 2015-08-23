# Profile
class Profile
  include Mongoid::Document

  field :first_name, type: String
  field :last_name, type: String
  field :date_of_birth, type: Date

  belongs_to :user
end
