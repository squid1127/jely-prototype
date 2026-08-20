extends CharacterBody2D

@onready var animated_sprite:AnimatedSprite2D = $AnimatedSprite

const acceleration:float = 70
const friction:float = 0.9

func get_x() -> float:
	return Input.get_axis("movement_left", "movement_right")
	

func do_input() -> void:
	velocity.x += get_x() * acceleration
	velocity.x *= friction
	velocity.y += 30

func set_animation() -> void:
	if abs(velocity.x) < 100:
		animated_sprite.play("idle")
	elif abs(velocity.x) < 450:
		animated_sprite.play("slow", velocity.x / 500)
	else:
		animated_sprite.play("run", velocity.x / 300)
	
	var x = get_x()
	if x > 0:
		animated_sprite.flip_h = true
	elif x < 0:
		animated_sprite.flip_h = false


func _physics_process(delta: float) -> void:
	do_input()
	move_and_slide()
	set_animation()
	print(velocity)
