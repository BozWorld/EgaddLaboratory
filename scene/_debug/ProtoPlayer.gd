extends CharacterBody2D

var new_velocity: = Vector2.ZERO
@export var gravity: = 10

func _physics_process(delta: float) -> void:
	new_velocity = calculate_Movement(new_velocity, 50, 500)
	set_velocity(new_velocity)
	move_and_slide()
	return
	
	
func calculate_Movement ( linear_velocity: Vector2, impulse: float, verticalImpulse: float) -> Vector2:
		var out: = linear_velocity
		out.x = impulse	
#		out.y += gravity + get_physics_process_delta_time()
		
		return out
		
func handle_Gravity(linear_velocity: Vector2) -> Vector2:
	var new_velocity: = linear_velocity
	new_velocity.y += gravity + get_physics_process_delta_time()
	return new_velocity
