#define BASE_HEAL 4

/datum/component/netpod_healing

/datum/component/netpod_healing/Initialize(obj/machinery/netpod/pod)
	if (!iscarbon(parent))
		return COMPONENT_INCOMPATIBLE

<<<<<<< HEAD
	RegisterSignals(
		pod,
		list(COMSIG_MACHINERY_BROKEN, COMSIG_QDELETING, COMSIG_BITRUNNER_NETPOD_OPENED),
		PROC_REF(on_remove),
	)

	RegisterSignal(parent, COMSIG_MOVABLE_MOVED, PROC_REF(on_remove))
=======
	RegisterSignal(pod, COMSIG_BITRUNNER_NETPOD_OPENED, PROC_REF(on_opened))
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

	var/mob/living/carbon/player = parent
	player.apply_status_effect(/datum/status_effect/embryonic, STASIS_NETPOD_EFFECT)

	START_PROCESSING(SSmachines, src)

<<<<<<< HEAD
/datum/component/netpod_healing/Destroy(force)
=======
/datum/component/netpod_healing/Destroy(force, silent)
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	STOP_PROCESSING(SSmachines, src)

	var/mob/living/carbon/player = parent
	player.remove_status_effect(/datum/status_effect/embryonic)

	return ..()

/datum/component/netpod_healing/process(seconds_per_tick)
	var/mob/living/carbon/owner = parent
	if(isnull(owner))
		qdel(src)
		return

	var/need_mob_update = FALSE
	need_mob_update += owner.adjustBruteLoss(-BASE_HEAL * seconds_per_tick, updating_health = FALSE)
	need_mob_update += owner.adjustFireLoss(-BASE_HEAL * seconds_per_tick, updating_health = FALSE)
	need_mob_update += owner.adjustToxLoss(-BASE_HEAL * seconds_per_tick, updating_health = FALSE, forced = TRUE)
<<<<<<< HEAD
=======
	need_mob_update += owner.adjustCloneLoss(-BASE_HEAL * seconds_per_tick, updating_health = FALSE)
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

	if(owner.blood_volume < BLOOD_VOLUME_NORMAL)
		owner.blood_volume += BASE_HEAL * seconds_per_tick

	if(need_mob_update)
		owner.updatehealth()

/// Deletes itself when the machine was opened
<<<<<<< HEAD
/datum/component/netpod_healing/proc/on_remove()
=======
/datum/component/netpod_healing/proc/on_opened()
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	SIGNAL_HANDLER

	qdel(src)

/datum/status_effect/embryonic
	id = "embryonic"
	alert_type = /atom/movable/screen/alert/status_effect/embryonic

/datum/status_effect/embryonic/on_apply()
<<<<<<< HEAD
	ADD_TRAIT(owner, TRAIT_STASIS, TRAIT_STATUS_EFFECT(id))
	return TRUE

/datum/status_effect/embryonic/on_remove()
	REMOVE_TRAIT(owner, TRAIT_STASIS, TRAIT_STATUS_EFFECT(id))
=======
	. = ..()
	if(.)
		ADD_TRAIT(owner, TRAIT_STASIS, TRAIT_STATUS_EFFECT(id))

/datum/status_effect/embryonic/on_remove()
	REMOVE_TRAIT(owner, TRAIT_STASIS, TRAIT_STATUS_EFFECT(id))
	return ..()
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

/atom/movable/screen/alert/status_effect/embryonic
	name = "Embryonic Stasis"
	icon_state = "netpod_stasis"
	desc = "You feel like you're in a dream."

#undef BASE_HEAL
