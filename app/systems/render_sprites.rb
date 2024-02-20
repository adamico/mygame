class RenderSprites < Draco::System
  filter Position, Sprite, Size

  def tick args
    raise "RENDERSPRITES NIL" if entities.nil?

    sprites = entities.map do |entity|
      {
        x: entity.position.x,
        y: entity.position.y,
        w: entity.size.w,
        h: entity.size.h,
        path: entity.sprite.path
      }
    end

    args.outputs.sprites << sprites
  end
end