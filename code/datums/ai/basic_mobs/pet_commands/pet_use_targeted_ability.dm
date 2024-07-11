/// Pet owners can't see their pet's ability cooldowns so we keep attempting to use an ability until we succeed
/datum/ai_behavior/pet_use_ability
	behavior_flags = AI_BEHAVIOR_REQUIRE_MOVEMENT | AI_BEHAVIOR_MOVE_AND_PERFORM

/datum/ai_behavior/pet_use_ability/setup(datum/ai_controller/controller, ability_key, target_key)
	. = ..()
	var/mob/living/target = controller.blackboard[target_key]
	if (QDELETED(target))
		return FALSE
	set_movement_target(controller, target)

/datum/ai_behavior/pet_use_ability/perform(seconds_per_tick, datum/ai_controller/controller, ability_key, target_key)
	var/datum/action/cooldown/mob_cooldown/ability = controller.blackboard[ability_key]
	var/mob/living/target = controller.blackboard[target_key]
	if (QDELETED(ability) || QDELETED(target))
<<<<<<< HEAD
		return AI_BEHAVIOR_INSTANT | AI_BEHAVIOR_FAILED
	var/mob/pawn = controller.pawn
	if(QDELETED(pawn) || ability.InterceptClickOn(pawn, null, target))
		return AI_BEHAVIOR_INSTANT | AI_BEHAVIOR_SUCCEEDED
	return AI_BEHAVIOR_INSTANT
=======
		finish_action(controller, FALSE, ability_key, target_key)
		return
	var/mob/pawn = controller.pawn
	if(QDELETED(pawn) || ability.InterceptClickOn(pawn, null, target))
		finish_action(controller, TRUE, ability_key, target_key)
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

/datum/ai_behavior/pet_use_ability/finish_action(datum/ai_controller/controller, succeeded, ability_key, target_key)
	. = ..()
	controller.clear_blackboard_key(target_key)
