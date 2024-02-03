extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var rotation_amount = 1
var rotation_lock = 0.5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_physical_key_pressed(KEY_S):
		rotation.x = clampf(rotation.x + (rotation_amount * delta), -rotation_lock, rotation_lock)
	if Input.is_physical_key_pressed(KEY_W):
		rotation.x = clampf(rotation.x + (-rotation_amount * delta), -rotation_lock, rotation_lock)
	if Input.is_physical_key_pressed(KEY_A):
		rotation.z = clampf(rotation.z + (rotation_amount * delta), -rotation_lock, rotation_lock)
	if Input.is_physical_key_pressed(KEY_D):
		rotation.z = clampf(rotation.z + (-rotation_amount * delta), -rotation_lock, rotation_lock)
	transform = transform.orthonormalized()


func _integrate_forces(state):
	var new_rot = clamp(basis.get_rotation_quaternion().x,-0.2,0.2)
	var new_transform = Transform3D(new_rot, position)
	state.transform = new_transform
