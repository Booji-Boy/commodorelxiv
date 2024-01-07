/datum/ai_controller/basic_controller/goose
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic/not_friends,
		//why define my own keys when i can just steal other people's that sound vaguely similar?
		BB_GLARE_ABILITY = "BB_vomitGoose", //stores our vomit ability
		BB_MONKEY_PICKUPTARGET = null, //stores the item we're trying to eat
	)

	ai_traits = STOP_MOVING_WHEN_PULLED
	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk

	planning_subtrees = list(
		// /datum/ai_planning_subtree/target_retaliate,
		/datum/ai_planning_subtree/find_vomit,
		// /datum/ai_planning_subtree/vomit_melee_attack_subtree,
	)

//looks at given items, gets best throw force
/proc/GetBestThrow(datum/ai_controller/controller, list/choices)
	var/top_force = 0
	var/obj/item/top_force_item


	for(var/obj/item/item as anything in choices)
		if(!item)
			continue
		if(item.throwforce <= top_force)
			continue
		top_force_item = item
		top_force = item.throwforce

	return top_force_item

//this is so we can call the vomit ability from within the hostile ai functions
/datum/ai_controller/basic_controller/goose/proc/VomitCall(atom/target)
	var/mob/living/caller = src.pawn
	var/datum/action/cooldown/mob_cooldown/vomitGoose/vom = null

	//search actions for vomit ability and assign it as vom
	for(var/thing in caller.actions)
		if(istype(thing, /datum/action/cooldown/mob_cooldown/vomitGoose))
			vom = thing

	//caller.visible_message(span_notice("DEBUG: [caller] controller has called vomit against [target]!"))
	//this directly calls the vomit function from within the ability, passing through the target provided
	//because the game won't let me queue abilities in the ai controller from within the hostile ai functions
	//so we bypass queuing the ability entirely and just call the function directly
	if(vom.eaten_items.len>0)
		vom.vom(caller,target)
	else
		//couldn't vomit at enemy? gag and try to find something else to vomit
		vom.gag(caller)
		src.TryFindVomit()

//tries to find item with >4 throw force. if successful, moves to and tries to eat it
/datum/ai_controller/basic_controller/goose/proc/TryFindVomit()
	var/mob/living/simple_animal/hostile/retaliate/newgoose/caller = src.pawn
	var/obj/item/weapon

	var/list/nearby_items = list()
	//looks 2 tiles out by default
	for(var/obj/item/item in oview(2, src.pawn))
		nearby_items += item

	weapon = GetBestThrow(src, nearby_items)

	if(!weapon )
		return FALSE

	if(weapon.throwforce < 6) // don't bother eating anything with less than 6 throw damage
		return FALSE
	
	//caller.visible_message(span_notice("DEBUG: [caller] is trying to eat [weapon]!"))
	caller.seeking_food = 1 //if we managed to find something to eat, set our owner seeking_food to 1 so that we don't try to attack anything until we've finished eating
	set_blackboard_key(BB_MONKEY_PICKUPTARGET, weapon)
	set_movement_target(type, weapon)
	src.queue_behavior(/datum/ai_behavior/targeted_mob_ability/vomit, BB_GLARE_ABILITY, BB_MONKEY_PICKUPTARGET)

	return TRUE
