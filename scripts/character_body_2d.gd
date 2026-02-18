extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 200.0

func _process(delta: float) -> void:
	var direction_x := Input.get_axis("ui_left", "ui_right")
	var direction_y = Input.get_axis("ui_up", "ui_down")
	
	if direction_x:
		velocity.x = direction_x * SPEED
		if direction_x == -1:
			sprite.play("left")
		else:
			sprite.play("right")


	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction_y:
		velocity.y = direction_y * SPEED
		if direction_y == -1:
			sprite.play("back")
		else:
			sprite.play("front")
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	if direction_x and direction_y:
		velocity.x = (direction_x * SPEED) / sqrt(2)
		velocity.y = (direction_y * SPEED) / sqrt(2)

	move_and_slide()
