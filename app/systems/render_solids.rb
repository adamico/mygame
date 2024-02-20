class RenderSolids < Draco::System
  filter Solid, Position
  def tick args
    raise "RENDERSOLIDS NIL" if entities.nil?

    solids = entities.map do |entity|
      {
        x: entity.position.x,
        y: entity.position.y,
        w: entity.solid.w,
        h: entity.solid.h,
        r: entity.color.r,
        g: entity.color.g,
        b: entity.color.b,
        a: entity.color.a
      }.solid
    end

    args.outputs.solids << solids
  end
end