extends Object

class_name ValueDistorter

var max_val = 2.0
var min_val = 0.5

func distort(volume):
	var rnd = rand_range(min_val,max_val) * volume
	return(rnd)

func round_distort(volume):
	var rnd = rand_range(min_val,max_val) * volume
	return(round(rnd))

