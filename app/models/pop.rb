# Pop
class Pop
  include Mongoid::Document

  field :name, type: String
  field :country, type: String
  field :city, type: String
  field :adress, type: String
  field :working_from, type: String
  field :working_till, type: String
  field :cash, type: Boolean
  field :card, type: Boolean
  field :description, type: String

  validates :name, :country, :city, :adress, :working_from, :working_till, presence: true
  validates_associated :store

  belongs_to :store
  embeds_many :deliveries
  has_many :ware_storages, dependent: :destroy
end
