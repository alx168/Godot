#uncomment all the code to see
extends Node3D
##THIS SCRIPT IS REDUNDANT AND ONLY USEFUL TO TEACH ME EMISSIONS AND BINDING.
#signal _game_won
## Called when the node enters the scene tree for the first time.
#func _ready():
	##An example of passing parameters, we bind 
	 ##and then access whatever variables we passed along in our signal emission
	##in this example, see update_score.gd to notice we passed score and "test_binding" as part
	 ##of our emission call. Then we just simply call bind here during our connect on the callable _on_score_update
	##don't forget to fill all parameters in the callable signiture, it will silently fail.
	#
	#$Control/Score.score_update.connect(_on_score_update.bind())
#
#func _on_score_update(score, something):
	#if score == 10:
		#print('game won')
		#
	#print(something)
