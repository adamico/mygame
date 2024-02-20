class HandleInput < Draco::System
  filter Tag(:player_controlled), Position, Speed

  def tick(args)
    entities.each do |entity|
      handle_mouse(entity, args)
      handle_keyboard(entity, args)
    end
  end

  def handle_mouse(entity, args)
    mouse = args.inputs.mouse
    state = args.state
    size = entity.size
    rotation = entity.rotation
    position = entity.position

    state.entity_grabbed ||= false

    if mouse.click
      if mouse.inside_rect?({ x: position.x, y: position.y, w: size.width, h: size.height })
        state.entity_grabbed = !state.entity_grabbed
        state.entity_grabbed_at = state.tick_count
      end
    end

    if state.entity_grabbed
      position.x = mouse.x - size.width * rotation.anchor_x
      position.y = mouse.y - size.height * rotation.anchor_y
      $gtk.hide_cursor
    else
      $gtk.show_cursor
    end
  end

  def handle_keyboard(entity, args)
    speed = entity.speed.speed
    entity.position.x += args.inputs.left_right * speed
    entity.position.y += args.inputs.up_down * speed
  end
end