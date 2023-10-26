extends CanvasLayer

@onready var points_label := $MarginContainer/VBoxContainer/HBoxContainer/PointsLabel

func _ready():
	Events.points_changed.connect(points_update)
	Events.lives_changed.connect(lives_update)

func points_update( points: int):
	points_label.text = str( points)

func lives_update( lives: int):
	pass
