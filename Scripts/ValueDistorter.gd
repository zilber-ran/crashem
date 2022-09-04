extends Object

class_name ValueDistorter

var max_val = 2.0
var min_val = 0.5

func distort(volume):
	randomize()
	var rnd = rand_range(min_val,max_val) * volume
	return(rnd)

func round_distort(volume):
	randomize()
	var rnd = rand_range(min_val,max_val) * volume
	return(round(rnd))

func coin_flip(chance):
	var luck = 1- (1/chance)
	randomize()
	var coin_roll = rand_range(0,1)
	if luck >= coin_roll:
		return(true)
	else:
		return(false)

func distort_vector2_Wlength(length):
	var distorted_length = distort(length)
	var angle = randi() % 360
	var ans = Vector2.RIGHT.rotated(deg2rad(angle))*distorted_length
	return(ans)


func distort_vector2(vector2:Vector2):
	var distorted_length = distort(vector2.length())
	var angle = randi() % 360
	var ans = Vector2.RIGHT.rotated(deg2rad(angle))*distorted_length
	return(ans)
