extends Node2D
# Enemies creation
const POSITION_INIT_X = [ 25, 40, 25]
const POSITION_INIT_Y = [ 15, 40, 65]
const POSITION_STEP = 30.0
# Movement
const ROW_STEP = 10.0
const SPEED_BOOST = 2.5
 
@onready var enemy = preload("res://elements/enemy/enemy.tscn")
@onready var block_timer = $BlockTimer
@onready var short_timer = $ShotTimer

var direction = Vector2.RIGHT
var speed = 5.0

func _ready():
	create_enemies( 3)

func _process(delta):
	global_position += direction * speed * delta

func change_direction():
	if block_timer.time_left > 0:
		return
	block_timer.start()
	direction = Vector2.LEFT if direction == Vector2.RIGHT else Vector2.RIGHT
	global_position.y += ROW_STEP
	speed += SPEED_BOOST

func create_enemies( rows: int):
	for row in range (rows):
		for i in range ( 7):
			var item: CharacterBody2D = enemy.instantiate()
			item.position.y = POSITION_INIT_Y[row]
			item.position.x =  POSITION_INIT_X[row] + i * POSITION_STEP
			add_child(item)


func _on_shot_timer_timeout():
	var enemies = get_tree().get_nodes_in_group("enemy")
	if enemies.size() > 0:
		enemies.pick_random().shot()
