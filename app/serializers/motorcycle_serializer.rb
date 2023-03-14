class MotorcycleSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :description, :price, :model, :available
end
