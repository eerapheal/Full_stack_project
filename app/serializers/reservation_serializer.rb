class ReservationSerializer < ActiveModel::Serializer
  belongs_to :motorcycles
  attributes :id, :start_time, :end_time
end
