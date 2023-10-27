extends Node2D

const GAME_OVER_SCENE = preload("res://ui/game_over/game_over.tscn")

func _ready():
	Events.lives_changed.connect(func(lives): check_game_over())
	Events.enemy_died.connect(check_game_over)
	
func check_game_over():
	print(Globals.lives)
	var enemies := get_tree().get_nodes_in_group( "enemy")
	if Globals.lives <= 0 or enemies.size() <= 1 :
		add_child(GAME_OVER_SCENE.instantiate())

