extends Node2D

onready var animation_punch = $Animation

var center
var offset

func _ready():
	center = get_viewport_rect().size.x / 2
	offset = abs(position.x - center)
	
func _input(event):
	if (event is InputEventMouseButton or event is InputEventScreenTouch) and event.is_pressed():
		if event.position.x < center:
			position.x = offset - center
			scale.x = -abs(scale.x)
		else:
			position.x = center - offset
			scale.x = abs(scale.x)
		animation_punch.play("Punch")
