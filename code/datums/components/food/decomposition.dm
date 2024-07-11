//"Don't leave food on the floor, that's how we get ants"

#define DECOMPOSITION_TIME (10 MINUTES)
#define DECOMPOSITION_TIME_RAW (5 MINUTES)
#define DECOMPOSITION_TIME_GROSS (7 MINUTES)

///Makes things decompose when exposed to germs. Requires /datum/component/germ_sensitive to detect exposure.
/datum/component/decomposition
	dupe_mode = COMPONENT_DUPE_UNIQUE
	/// Makes sure maploaded food only starts decomposing if a player's EVER picked it up before
	var/handled = TRUE
	/// Used to stop food in someone's hand & in storage slots from decomposing.
	var/protected = FALSE
	/// The total time that this takes to decompose
	var/original_time = DECOMPOSITION_TIME
	/// Used so the timer won't reset.
	var/time_remaining = DECOMPOSITION_TIME
	/// Used to create stink lines when the food is close to going bad
	var/stink_timerid
	/// Used to stop decomposition & check for the examine proc
	var/decomp_timerid
	/// Used to give raw/gross food lower timers
	var/decomp_flags
	/// Use for determining what kind of item the food decomposes into.
	var/decomp_result
	/// Does our food attract ants?
	var/produce_ants = FALSE
	/// Stink particle type, if we are supposed to create stink particles
	var/stink_particles
	/// Stink particle holder
	var/obj/effect/abstract/particle_holder/particle_effect

/datum/component/decomposition/Initialize(mapload, decomp_req_handle, decomp_flags = NONE, decomp_result, ant_attracting = FALSE, custom_time = 0, stink_particles = /particles/stink)
	if(!ismovable(parent) || !HAS_TRAIT(parent, TRAIT_GERM_SENSITIVE))
		return COMPONENT_INCOMPATIBLE

	src.decomp_flags = decomp_flags
	src.decomp_result = decomp_result
	if(mapload || decomp_req_handle)
		handled = FALSE
	src.produce_ants = ant_attracting

<<<<<<< HEAD
=======
	RegisterSignal(parent, COMSIG_MOVABLE_MOVED, PROC_REF(handle_movement))
	RegisterSignals(parent, list(
		COMSIG_ITEM_PICKUP, //person picks up an item
		COMSIG_ATOM_ENTERED), //Object enters a storage object (boxes, etc.)
		PROC_REF(picked_up))
	RegisterSignals(parent, list(
		COMSIG_ITEM_DROPPED, //Object is dropped anywhere
		COMSIG_ATOM_EXITED), //Object exits a storage object (boxes, etc)
		PROC_REF(dropped))
	RegisterSignal(parent, COMSIG_ATOM_EXAMINE, PROC_REF(examine))

>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	if(custom_time) // We have a custom decomposition time, set it to that
		original_time = custom_time
	else if(decomp_flags & RAW) // Raw food overrides gross
		original_time = DECOMPOSITION_TIME_RAW
	else if(decomp_flags & GROSS)
		original_time = DECOMPOSITION_TIME_GROSS

	time_remaining = original_time

	src.stink_particles = stink_particles

/datum/component/decomposition/Destroy()
	. = ..()
	if(particle_effect)
		QDEL_NULL(particle_effect)

/datum/component/decomposition/RegisterWithParent()
	RegisterSignal(parent, COMSIG_ATOM_GERM_EXPOSED, PROC_REF(start_timer))
	RegisterSignal(parent, COMSIG_ATOM_GERM_UNEXPOSED, PROC_REF(remove_timer))
	RegisterSignal(parent, COMSIG_ATOM_EXAMINE, PROC_REF(examine))

/datum/component/decomposition/UnregisterFromParent()
	UnregisterSignal(parent, list(
<<<<<<< HEAD
		COMSIG_ATOM_GERM_EXPOSED,
		COMSIG_ATOM_GERM_UNEXPOSED,
		COMSIG_ATOM_EXAMINE
	))
=======
		COMSIG_ITEM_PICKUP,
		COMSIG_ATOM_ENTERED,
		COMSIG_MOVABLE_MOVED,
		COMSIG_ITEM_DROPPED,
		COMSIG_ATOM_EXITED,
		COMSIG_ATOM_EXAMINE))
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

/datum/component/decomposition/proc/start_timer()
	SIGNAL_HANDLER

	if(!handled) // If maploaded, has someone touched this previously?
		handled = TRUE // First germ exposure is ignored
		return

	// If all other checks fail, then begin decomposition.
	decomp_timerid = addtimer(CALLBACK(src, PROC_REF(decompose)), time_remaining, TIMER_STOPPABLE | TIMER_UNIQUE)

	// Also start the stinking timer, if have stink particles and aren't stinking yet
	if(!stink_particles || particle_effect)
		return

	var/stink_time = max(0, time_remaining - (original_time * 0.5))
	stink_timerid = addtimer(CALLBACK(src, PROC_REF(stink_up)), stink_time, TIMER_STOPPABLE | TIMER_UNIQUE)

/datum/component/decomposition/Destroy()
	remove_timer()
	return ..()

/// Returns the time remaining in decomp, either from our potential timer or our own value, whichever is more useful
/datum/component/decomposition/proc/get_time()
<<<<<<< HEAD
	if(!decomp_timerid)
		return time_remaining
	return timeleft(decomp_timerid)

/datum/component/decomposition/proc/remove_timer()
	if(!decomp_timerid)
		return
	time_remaining = timeleft(decomp_timerid)
	deltimer(decomp_timerid)
	decomp_timerid = null
	if(!stink_timerid)
		return
	deltimer(stink_timerid)
	stink_timerid = null
=======
	if(!timerid)
		return time_remaining
	return timeleft(timerid)

/datum/component/decomposition/proc/remove_timer()
	if(!timerid)
		return
	time_remaining = timeleft(timerid)
	deltimer(timerid)
	timerid = null
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

/datum/component/decomposition/proc/stink_up()
	stink_timerid = null
	// Neither should happen, but to be sure
	if(particle_effect || !stink_particles)
		return
	// we don't want stink lines on mobs (even though it'd be quite funny)
	particle_effect = new(parent, stink_particles, isitem(parent) ? NONE : PARTICLE_ATTACH_MOB)

/datum/component/decomposition/proc/decompose()
	decomp_timerid = null
	var/obj/decomp = parent //Lets us spawn things at decomp
	if(produce_ants)
		new /obj/effect/decal/cleanable/ants(decomp.loc)
	if(decomp_result)
		new decomp_result(decomp.loc)
	decomp.visible_message(span_warning("[decomp] gets overtaken by mold[produce_ants ? " and ants":""]! Gross!"))
	qdel(decomp)
	return

/datum/component/decomposition/proc/examine(datum/source, mob/user, list/examine_list)
	SIGNAL_HANDLER
	var/time_d = get_time()
	switch(time_d / original_time)
		if(0.5 to 0.75) // 25% rotten
			examine_list += span_notice("[parent] looks kinda stale.")
		if(0.25 to 0.5) // 50% rotten
			examine_list += span_notice("[parent] is starting to look pretty gross.")
		if(0 to 0.25) // 75% rotten
			examine_list += span_danger("[parent] barely looks edible.")

#undef DECOMPOSITION_TIME
#undef DECOMPOSITION_TIME_GROSS
#undef DECOMPOSITION_TIME_RAW
