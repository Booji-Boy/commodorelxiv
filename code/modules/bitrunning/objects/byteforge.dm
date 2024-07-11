/obj/machinery/byteforge
	name = "byteforge"

	circuit = /obj/item/circuitboard/machine/byteforge
	desc = "A machine used by the quantum server. Quantum code converges here, materializing decrypted assets from the virtual abyss."
	icon = 'icons/obj/machines/bitrunning.dmi'
	icon_state = "byteforge"
<<<<<<< HEAD
	obj_flags = BLOCKS_CONSTRUCTION | CAN_BE_HIT
=======
	obj_flags = BLOCKS_CONSTRUCTION
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	/// Idle particles
	var/mutable_appearance/byteforge_particles

/obj/machinery/byteforge/Initialize(mapload)
	. = ..()

	return INITIALIZE_HINT_LATELOAD

<<<<<<< HEAD
/obj/machinery/byteforge/post_machine_initialize()
	. = ..()

=======
/obj/machinery/byteforge/LateInitialize()
	. = ..()

	byteforge_particles = mutable_appearance(initial(icon), "on_particles", ABOVE_MOB_LAYER)
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	setup_particles()

/obj/machinery/byteforge/update_appearance(updates)
	. = ..()

	setup_particles()

<<<<<<< HEAD
/// Does some sparks after it's done
/obj/machinery/byteforge/proc/flash(atom/movable/thing)
	playsound(src, 'sound/magic/blink.ogg', 50, TRUE)

	var/datum/effect_system/spark_spread/quantum/sparks = new()
	sparks.set_up(5, 1, loc)
	sparks.start()

	set_light(l_on = FALSE)

/// Forge begins to process
/obj/machinery/byteforge/proc/flicker(angry = FALSE)
	var/mutable_appearance/lighting = mutable_appearance(initial(icon), "on_overlay[angry ? "_angry" : ""]")
	flick_overlay_view(lighting, 1 SECONDS)

	set_light(l_range = 2, l_power = 1.5, l_color = angry ? LIGHT_COLOR_BUBBLEGUM : LIGHT_COLOR_BABY_BLUE, l_on = TRUE)

/// Adds the particle overlays to the byteforge
/obj/machinery/byteforge/proc/setup_particles(angry = FALSE)
	cut_overlay(byteforge_particles)

	byteforge_particles = mutable_appearance(initial(icon), "on_particles[angry ? "_angry" : ""]", ABOVE_MOB_LAYER)
=======
/// Adds the particle overlays to the byteforge
/obj/machinery/byteforge/proc/setup_particles()
	cut_overlays()
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

	if(is_operational)
		add_overlay(byteforge_particles)

<<<<<<< HEAD
/// Forge is done processing
/obj/machinery/byteforge/proc/spawn_cache(obj/cache)
	if(QDELETED(cache))
		return

	flash()

	cache.forceMove(loc)

/// Timed flash
/obj/machinery/byteforge/proc/start_to_spawn(obj/cache)
	flicker()

	addtimer(CALLBACK(src, PROC_REF(spawn_cache), cache), 1 SECONDS)

=======
/// Begins spawning the crate - lights, overlays, etc
/obj/machinery/byteforge/proc/start_to_spawn(obj/structure/closet/crate/secure/bitrunning/encrypted/cache)
	addtimer(CALLBACK(src, PROC_REF(spawn_crate), cache), 1 SECONDS, TIMER_UNIQUE|TIMER_OVERRIDE|TIMER_STOPPABLE)

	var/mutable_appearance/lighting = mutable_appearance(initial(icon), "on_overlay")
	flick_overlay_view(lighting, 1 SECONDS)

//	set_light(l_range = 2, l_power = 1.5, l_color = LIGHT_COLOR_BABY_BLUE, l_on = TRUE) MONKEYSTATION EDIT ORIGINAL - We have changed lights
	set_light(l_inner_range = 1, l_outer_range = 2, l_power = 1.5, l_color = LIGHT_COLOR_BABY_BLUE, l_on = TRUE) // MONKEYSTATION EDIT NEW

/// Sparks, moves the crate to the location
/obj/machinery/byteforge/proc/spawn_crate(obj/structure/closet/crate/secure/bitrunning/encrypted/cache)
	if(QDELETED(cache))
		return

	playsound(src, 'sound/magic/blink.ogg', 50, TRUE)
	var/datum/effect_system/spark_spread/quantum/sparks = new()
	sparks.set_up(5, 1, loc)
	sparks.start()

	cache.forceMove(loc)
	set_light(l_on = FALSE)
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
