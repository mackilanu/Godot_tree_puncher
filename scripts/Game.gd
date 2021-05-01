extends Node2D

export(PackedScene) var trunk_scene
onready var first_trunk_pos = $FirstTrunkPosition
var last_spawn_pos

func _ready():
	last_spawn_pos = first_trunk_pos.position
	_spawn_first_trunks()

func _spawn_first_trunks():
	for i in range(5):
		var new_trunk = trunk_scene.instance()
		add_child(new_trunk)
		new_trunk.position	= last_spawn_pos
		last_spawn_pos.y -= new_trunk.sprite_height
		new_trunk.init_trunk(false, false)
