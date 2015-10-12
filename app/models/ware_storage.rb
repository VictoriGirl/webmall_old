# WareStorage
class WareStorage

  include Mongoid::Document

  field :price, type: Float

  field :count, type: Integer
  field :in_sight, type: Boolean

  validates_associated :pop, :ware, :store

  belongs_to :pop
  belongs_to :ware
  belongs_to :store
end
