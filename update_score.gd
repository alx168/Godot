extends RichTextLabel

signal score_update
var score = 0
# Called when the node enters the scene tree for the first time.
func _ready():
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
		text = 'You Win!'
	else:
		text = 'Score: '+ str(score)
	score_update.emit(score, "test_binding")
