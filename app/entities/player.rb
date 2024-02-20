class Player < Draco::Entity
  component Position, x: 640, y:360
  component Rotation, anchor_x: 0.5, anchor_y: 0.5
  component Size, width: 64, height: 64
  component Speed, speed: 8
  component Sprite, path: 'sprites/square/blue.png'
  component Tag(:player_controlled)
  component Visible
end