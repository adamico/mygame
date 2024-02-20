class Sprite < Draco::Component
  attribute :w
  attribute :h
  attribute :anchor_x, default: 0.5
  attribute :anchor_y, default: 0.5
  attribute :path
end