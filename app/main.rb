class Game
  attr_gtk

  def tick
    defaults
    calc
    render
  end

  def defaults
    state.player ||= state.new_entity(:player) do |entity|
      entity.x = grid.w / 2
      entity.y = grid.h / 2
      entity.speed = 8
      entity.direction_x = 0
      entity.direction_y = 0
      entity.size = 64

      entity.sprite = {
        x: entity.x,
        y: entity.y,
        w: entity.size,
        h: entity.size,
        anchor_x: 0.5,
        anchor_y: 0.5,
        path: 'sprites/square/blue.png'
      }
    end
  end

  def calc
    calc_player
    state.next_scene = :game_over if inputs.keyboard.escape
  end

  def calc_player
    mouse = inputs.mouse
    player_sprite = player.sprite
    state.player_grabbed ||= false

    if mouse.click
      if mouse.inside_rect?(player_sprite)
        state.player_grabbed = !state.player_grabbed
        state.player_grabbed_at = state.tick_count
      end
    end

    if state.player_grabbed
      player_sprite.x = mouse.x
      player_sprite.y = mouse.y
      gtk.hide_cursor
    else
      gtk.show_cursor
    end

    player_sprite.x += inputs.left_right * player.speed
    player_sprite.y += inputs.up_down * player.speed
  end

  def render
    render_player
    render_ui
  end

  def render_player
    outputs.sprites << player.sprite
  end

  def render_ui

    if state.player_grabbed
      label = 'Click to release the square'
    else
      label = 'Click the square to grab and move'
      args.outputs.labels << [640, 120, 'you can also move the square with W A S D or cursor arrows', 5, 1]
    end
    args.outputs.labels << [640, 700, label, 5, 1]
    args.outputs.labels << [640, 60, 'Press Esc to go to Game Over', 5, 1]
  end

  def player
    state.player
  end
end

def tick_title args
  args.outputs.labels << [640, 540, 'Game Title', 5, 1]
  args.outputs.labels << [640, 460, 'Click Mouse to start', 5, 1]

  args.outputs.labels << {
    x: 640,
    y: 60,
    text: 'made with DragonRuby',
    size_enum: 2,
    alignment_enum: 1
  }

  args.state.next_scene = :game if args.inputs.mouse.click
end

def tick_game args
  $game ||= Game.new
  $game.args = args
  $game.tick
end

def tick_game_over args
  args.outputs.labels << [640, 540, 'Game Over', 5, 1]
  args.outputs.labels << [640, 460, 'Click Mouse to go to Title', 5, 1]

  args.state.next_scene = :title if args.inputs.mouse.click
end

def tick args
  args.state.current_scene ||= :game
  current_scene = args.state.current_scene

  case current_scene
  when :title
    tick_title args
  when :game
    tick_game args
  when :game_over
    tick_game_over args
  end

  scene_change_error = "Scene was changed incorrectly. Set args.state.next_scene to change scenes."
  raise scene_change_error if args.state.current_scene != current_scene

  if args.state.next_scene
    args.state.current_scene = args.state.next_scene
    args.state.next_scene = nil
  end
end

$game = nil

$gtk.reset
