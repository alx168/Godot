extends AudioStreamPlayer3D

# Called when the node enters the scene tree for the first time.
func _ready():
	var coinsgroup = get_tree().get_nodes_in_group('coins')
	for coin in coinsgroup:
		coin.coin_destroyed.connect(_on_coin_destroyed)

func _on_coin_destroyed():
	play()

func _on_score_game_won():
	play()
	await get_tree().create_timer(0.5).timeout
	play()
	await get_tree().create_timer(0.5).timeout
	play()
