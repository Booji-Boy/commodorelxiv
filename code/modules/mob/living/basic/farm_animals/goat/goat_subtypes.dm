/mob/living/basic/goat/pete // Pete!
	name = "Pete"
	gender = MALE

/mob/living/basic/goat/pete/examine()
	. = ..()
	var/area/goat_area = get_area(src)
	if((bodytemperature < T20C) || istype(goat_area, /area/station/service/kitchen/coldroom))
		. += span_notice("[p_They()] [p_do()]n't seem to be too bothered about the cold.") // special for pete

<<<<<<< HEAD
=======
/mob/living/basic/goat/pete/add_udder()
	return //no thank you
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
