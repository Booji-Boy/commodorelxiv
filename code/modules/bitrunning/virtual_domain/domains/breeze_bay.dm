/datum/lazy_template/virtual_domain/breeze_bay
	name = "Breeze Bay"
	desc = "A beach front town with a large forest to the north."
	help_text = "It's simple! Enjoy some rays, catch some fish, and have a good time! Don't get bit by the crabs, though."
	key = "breeze_bay"
	map_name = "breeze_bay"
<<<<<<< HEAD
	reward_points = BITRUNNER_REWARD_LOW
=======
	safehouse_path = /datum/map_template/safehouse/wood
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

/datum/lazy_template/virtual_domain/breeze_bay/setup_domain(list/created_atoms)
	. = ..()

	for(var/obj/item/fishing_rod/rod in created_atoms)
		RegisterSignal(rod, COMSIG_FISHING_ROD_CAUGHT_FISH, PROC_REF(on_fish_caught))

/// Eventually reveal the cache
/datum/lazy_template/virtual_domain/breeze_bay/proc/on_fish_caught(datum/source, reward)
	SIGNAL_HANDLER

	if(isnull(reward))
		return

	add_points(2)
