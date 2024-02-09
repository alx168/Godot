extends Node3D

signal coin_destroyed
signal coin_overlap
@onready var area3d = get_node('Area3D')

func _ready():
	add_to_group('coins')
	position.y = 0.73
	position.z = randf_range(-6.9, 6.9) 
	position.x = randf_range(-6.9, 6.9) 
	while area3d.has_overlapping_areas():
		print('overlap')
		position.x = randf_range(-6.9, 6.9) 
		position.z = randf_range(-6.9, 6.9)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate_y(3 * delta)
	if area3d.has_overlapping_bodies():	
		queue_free()
		coin_destroyed.emit()
