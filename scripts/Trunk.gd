extends Node2D

var speed = 250
var direction = 1

onready var sprite = $Sprite
onready var left_axe = $LeftAxe
onready var right_axe = $RightAxe

var sprite_height
func _ready():
	sprite_height = sprite.texture.get_height() * scale.y
	set_process(false)

func init_trunk(axe, right):
	if axe:
		if right:
			left_axe.queue_free()
		else:
			right_axe.queue_free()
	else:
		left_axe.queue_free()
		right_axe.queue_free()
		

func _process(delta):
	position.x += speed * direction * delta

func remove(from_right):
	if from_right:
		direction = 1
	else:
		direction = -1
