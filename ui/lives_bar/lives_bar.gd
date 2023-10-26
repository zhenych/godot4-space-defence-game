extends HBoxContainer

const LIVES_RECT := preload("res://ui/lives_bar/lives_rect.tscn")

func _ready():
	Events.lives_changed.connect( update_lives)
	update_lives( Globals.lives)

func update_lives( lives: int):
	if lives < 0:
		return
	var diff = lives - get_child_count()
	if diff == 0:
		return
	for i in abs(diff):
		add_life() if diff > 0 else remove_life()

func add_life():
	add_child(LIVES_RECT.instantiate())

func remove_life():
	get_child(0).queue_free()

