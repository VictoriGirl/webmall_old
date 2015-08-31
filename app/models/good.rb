# Good
class Good
  include Mongoid::Document

  field :name, type: String
  field :category, type: String
  field :description, type: String

  field :in_sight, type: Boolean
  field :count, type: Integer
  field :unit, type: String

  field :last_buying_date, type: DateTime

  validates :name, :category, :in_sight, :unit, presence: true

  belongs_to :store
end
