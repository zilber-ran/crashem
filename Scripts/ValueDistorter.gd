extends Object

class_name ValueDistorter

var max_val = 2.0
var min_val = 0.5

func distort(flt):
	var rnd = rand_range(min_val,max_val) * flt
	return(rnd)

func round_distort(flt):
	var rnd = rand_range(min_val,max_val) * flt
	return(round(rnd))

