extends Node2D

var Distorter = ValueDistorter.new()
export var distort_int = 5
export var chance = 2.0
export var vector = Vector2.RIGHT

# Called when the node enters the scene tree for the first time.
func _input(event):
	if event.is_action_pressed("ui_up"):
		print("distorted int = ", Distorter.round_distort(distort_int))
	elif event.is_action_pressed("ui_down"):
		print("The resault for coinflip with chance ",chance, 
		" are ", Distorter.coin_flip(chance))
	elif event.is_action_pressed("ui_left"):
		print("Randomized the vector ", vector," to ", 
		Distorter.distort_vector2(vector))
	elif event.is_action_pressed("ui_right"):
		print("Randomized the vector ", vector," to ", 
		Distorter.distort_vector2_Wlength(vector.length()), " using length")
