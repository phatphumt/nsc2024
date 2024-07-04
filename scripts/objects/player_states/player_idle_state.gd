extends State
class_name PlayerIdleState

@export var player: Player
@onready var animated_sprite = %AnimatedSprite2D

func enter():
	print("player idle state!")
	print(player.last_dir)
	match player.last_dir:
		Vector2.RIGHT:
			animated_sprite.play("side_idle")
			animated_sprite.flip_h = false
		Vector2.LEFT:
			animated_sprite.play("side_idle")
			animated_sprite.flip_h = true
		Vector2.UP:
			animated_sprite.play("back_idle")
			animated_sprite.flip_h = false
		Vector2.DOWN:
			animated_sprite.play("front_idle")
			animated_sprite.flip_h = false
		_:
			animated_sprite.play("front_idle")
			animated_sprite.flip_h = false


func physics_process(delta):
	if player.dir != Vector2.ZERO:
		Transitioned.emit(self, "walk")
