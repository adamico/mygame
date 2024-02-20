class Player < Draco::Entity
  component Size, w: 64, h: 64
  component Position, x: 640, y:360
  component Speed, value: 8
  component Sprite, path: 'sprites/square/blue.png'
  component Tag(:player_controlled)
end