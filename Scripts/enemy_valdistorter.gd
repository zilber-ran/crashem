extends ValueDistorter

class_name enemy_valdistorter

func calc_health(diff):
	var out = round_distort(diff)
	if out == 0 :
		return(1)
	else:
		return(out)

func calc_speed(diff):
	var out = round_distort(diff*5)
	return(out)

func calc_dammage(Diff):
	var out = round_distort(Diff*10)
	return(out)
