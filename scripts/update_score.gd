extends RichTextLabel

signal score_update
signal game_won
var score = 0

func format_text(string_to_format):
	return '[center]' + string_to_format + '[/center]'

func _ready():
	set_use_bbcode(true)
	add_to_group('scores')
	#programatically connecting nodes. The editor based way is also good. 
	#the next two lines are for a single node
	#var coin2Area3D = get_node('../../Box/coin2/Area3D')
	#coin2Area3D.coin_destroyed.connect(_on_coin_destroyed)
	#this is for a group of nodes. The coins group is created and attached to the coins first
	#see coin_rotate's _ready function for example.
	var coinsgroup = get_tree().get_nodes_in_group('coins')
	for coin in coinsgroup:
		#print(str(coin))
		coin.coin_destroyed.connect(_on_coin_destroyed)

func _on_coin_destroyed():
	print('signal recieved') 
	score+=1
	if score == 10:
		print('game won in update_score')
		text = format_text('You Win!')
		game_won.emit()
	else:
		text = format_text('Score: '+ str(score))
	score_update.emit(score, "test_binding")

#this one is connected via the editor, check ball node and click the node tab instead of inspector
func _on_ball_ball_lost():
	score = 0
	text = format_text('Ball lost. Resetting game.')
	#score_update.emit(score, 'lost the ball')
	await get_tree().create_timer(2.0).timeout
	get_tree().reload_current_scene()
