 //if we have anything in belly, keep rolling odds to vomit
/datum/ai_planning_subtree/random_vomit

/datum/ai_planning_subtree/random_vomit/SelectBehaviors(datum/ai_controller/basic_controller/goose/controller, seconds_per_tick)
	. = ..()
	var/mob/living/caller = controller.pawn
	var/datum/action/cooldown/mob_cooldown/vomitGoose/vom = null
	//var/amuse_chance = controller.amuse_chance

	//search actions for vomit ability and assign it as vom
	for(var/thing in caller.actions)
		if(istype(thing, /datum/action/cooldown/mob_cooldown/vomitGoose))
			vom = thing

	if(vom.eaten_items.len>0 && vom.eaten_items.len > (rand(0,9)))
		call(controller, "VomitCall")(null)

/datum/ai_planning_subtree/amusing

/datum/ai_planning_subtree/amusing/SelectBehaviors(datum/ai_controller/basic_controller/goose/controller, seconds_per_tick)
	. = ..()
	if((rand(0,controller.amuse_chance))==1)
		call(controller.pawn, "amuse")()

/// just calls TryFindVomit() in the controller regularly
/datum/ai_planning_subtree/find_vomit

/datum/ai_planning_subtree/find_vomit/SelectBehaviors(datum/ai_controller/basic_controller/goose/controller, seconds_per_tick)
	. = ..()
	call(controller, "TryFindVomit")()

/*
//this is just default mob melee, but it tries to vomit at target as well
/datum/ai_planning_subtree/vomit_melee_attack_subtree
	/// What do we do in order to attack someone?
	var/datum/ai_behavior/basic_melee_attack/melee_attack_behavior = /datum/ai_behavior/basic_vomit_attack
	/// Is this the last thing we do? (if we set a movement target, this will usually be yes)
	var/end_planning = TRUE

/datum/ai_planning_subtree/vomit_melee_attack_subtree/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	. = ..()
	if(!controller.blackboard_key_exists(BB_BASIC_MOB_CURRENT_TARGET))
		return
	//controller.pawn.visible_message(span_notice("[controller.pawn] subtree is attempting to vomit at hostile!"))
	//controller.queue_behavior(/datum/ai_behavior/targeted_mob_ability/vomit, BB_VOMIT_ABILITY, BB_BASIC_MOB_CURRENT_TARGET)
	controller.queue_behavior(melee_attack_behavior, BB_BASIC_MOB_CURRENT_TARGET, BB_TARGETING_STRATEGY, BB_BASIC_MOB_CURRENT_TARGET_HIDING_LOCATION)
	if (end_planning)
		return SUBTREE_RETURN_FINISH_PLANNING //we are going into battle...no distractions.
		*/
