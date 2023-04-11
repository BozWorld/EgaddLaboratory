extends CharacterBody2D

@export var PlayerSprite: Sprite2D
@export var gravity: = 130


func _ready() -> void:
	velocity = Vector2(0,0)
	
func _physics_process(delta: float) -> void:
	set_velocity(handle_Gravity(velocity))
	move_and_slide()
	return


func handle_Gravity(linear_velocity: Vector2) -> Vector2:
	var new_velocity: = linear_velocity
	new_velocity.y += gravity + get_physics_process_delta_time()
	return new_velocity
	
func _input(event):
	if event is InputEventScreenDrag:
#		var tween = get_tree().create_tween()
#		tween.tween_property(PlayerSprite, "scale", Vector2(5,5), 1)
#		tween.tween_callback(PlayerSprite.queue_free)
		return	
