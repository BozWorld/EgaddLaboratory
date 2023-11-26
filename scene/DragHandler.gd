extends Node2D

@export var richTextLabel : RichTextLabel
@export var trail : Line2D
@export var player : CharacterBody2D
var length = 10
var currentPos
var startPos = null
var EndPos: = Vector2.ZERO
var pos: = Vector2.ZERO


func _input(event):
	if event is InputEventScreenTouch and !event.pressed:
		EndPos = event.position
		startPos = null
	if event is InputEventScreenDrag:
		if startPos == null:
			startPos = event.position
		else : 
			richTextLabel.set_text(" CurrentPos: " + str ( event.position ))
			trail.add_point(event.position)
			while trail.get_point_count()> length:
				trail.remove_point(0)
		return

func _ImpulseProj(playerPos: Vector2, drag: Vector2, vel: Vector2) -> Vector2:
	var position: = playerPos
	position = - ( drag * vel)
	return position
