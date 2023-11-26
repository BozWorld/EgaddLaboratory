extends CharacterBody2D

@export var player_sprite: Sprite2D
@onready var project_timer = get_node("ProjectionTimer")

var gravity: = 5.0
var isPressing = false
var can_project = true
var t = 0.0

@export var impulse = float()
var StartPos = null
var EndPos = null
var direction = Vector2(0,0)
@onready var initial_velocity = Vector2(0,gravity)
@export var descreasing_speed = 0.01
var pos: = Vector2.ZERO
	
func _physics_process(delta: float) -> void:
	t += delta * descreasing_speed
	velocity.x = velocity.x + ( 0 - velocity.x ) * t
	impulse = clamp(impulse, 0, 1000)
	handle_Gravity(delta)
	project_Player()
	#velocity = gravity + impulse
	move_and_slide()
	return
	
func handle_Gravity(delta: float) :
	if isPressing == false:
		velocity.y += gravity + get_physics_process_delta_time()
	velocity.y = clamp(velocity.y,700.0,1000.0)	

func project_Player() :
	if StartPos != null && EndPos != null && !isPressing && can_project:
		velocity = direction * impulse
		
func _input(event):
	if event is InputEventScreenTouch and event.is_pressed and isPressing == false:
		isPressing = true
		StartPos = event.position
		velocity.y = 0
		return
	if event is InputEventScreenTouch and !event.pressed:
		isPressing = false
		EndPos = event.position
		direction = StartPos.direction_to(EndPos) * -1
		impulse = 1000
		project_timer.start()


func _on_projection_timer_timeout():
	can_project = false
