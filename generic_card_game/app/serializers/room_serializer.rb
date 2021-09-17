class RoomSerializer
  include JSONAPI::Serializer
  attributes :id, :uuid, :players
end
  