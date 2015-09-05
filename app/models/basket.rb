# Basket
class Basket
  include Mongoid::Document

  field :Date
  field :Status, type: String

  field :name, type: String
  field :email, type: String
  field :phone_number, type: String
  field :country, type: String
  field :city, type: String
  field :adress, type: String

  validates :name, :email, :phone_number, :country, :city, :adress, presence: true
  validates :Status, inclusion: { in: %w(new sent) }

  belongs_to :user
  has_many :calls
end