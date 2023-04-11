extends Node2D

@export var richTextLabel : RichTextLabel
@export var trail : Line2D
@export var player : CharacterBody2D
var length = 10
var currentPos
var pos: = Vector2.ZERO

func _input(event):
	if event is InputEventScreenDrag:
		richTextLabel.set_text(" CurrentPos: " + str ( event.position ))
		trail.add_point(event.position)
		while trail.get_point_count()> length:
			trail.remove_point(0)
		pos = _ImpulseProj(player.position, event.position,event.velocity)
		player.set_velocity(pos)
		player.move_and_slide()
		return

func _ImpulseProj(playerPos: Vector2, drag: Vector2, vel: Vector2) -> Vector2:
	var position: = playerPos
	position =- (playerPos - ( drag * vel))
	return position
