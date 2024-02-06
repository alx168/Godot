extends Area3D

signal coin_destroyed

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group('coins') # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if has_overlapping_bodies():
		print('bodied')
		get_parent_node_3d().queue_free()
		coin_destroyed.emit()
