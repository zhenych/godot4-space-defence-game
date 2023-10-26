extends Node

var lives: int = 3
var points: int = 0

func change_lives(diff: int):
	lives += diff
	Events.lives_changed.emit( lives)
	
func change_points( diff: int):
	points += diff
	Events.points_changed.emit( points)
