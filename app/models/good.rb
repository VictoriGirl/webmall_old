# Good
class Good
  include Mongoid::Document

  field :name, type: String
  field :category, type: String
  field :description, type: String

  field :in_sight, type: Boolean

  belongs_to :store
end
