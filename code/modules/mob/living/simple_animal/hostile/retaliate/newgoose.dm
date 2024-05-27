/mob/living/simple_animal/hostile/retaliate/newgoose
	name = "Not-So-Amusing Goose"
	desc = "Lay egg is not true."
	icon_state = "goose" // sprites by cogwerks from goonstation, used with permission
	icon_living = "goose"
	icon_dead = "goose_dead"
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	speak_chance = 0
	//ranged = TRUE
	//ranged_message = "glares"
	turns_per_move = 5
	butcher_results = list(/obj/item/food/meat/slab/grassfed = 2)
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	emote_taunt = list("hisses")
	taunt_chance = 30
	speed = 0
	maxHealth = 25
	health = 25
	harm_intent_damage = 5
	melee_damage_lower = 5
	melee_damage_upper = 5
	attack_verb_continuous = "pecks"
	attack_verb_simple = "peck"
	attack_sound = "goose"
	attack_vis_effect = ATTACK_EFFECT_BITE
	speak_emote = list("honks")
	faction = list(FACTION_NEUTRAL)
	attack_same = TRUE
	gold_core_spawnable = HOSTILE_SPAWN
	var/random_retaliate = TRUE
	var/icon_vomit_start = "vomit_start"
	var/icon_vomit = "vomit"
	var/icon_vomit_end = "vomit_end"
	var/message_cooldown = 0
	var/choking = FALSE
	var/seeking_food = 0 //if 1, don't try to attack
	ai_controller = /datum/ai_controller/basic_controller/goose


/mob/living/simple_animal/hostile/retaliate/newgoose/proc/feed(obj/item/food/tasty)
	//. = ..()
//	if(. || !istype(tasty))
	//	return FALSE

	var/datum/action/cooldown/mob_cooldown/vomitGoose/vom = null

	//search actions for vomit ability and assign it as vom
	for(var/thing in src.actions)
		if(istype(thing, /datum/action/cooldown/mob_cooldown/vomitGoose))
			vom = thing

	//max 15 items when feeding goose by hand
	if (vom.eaten_items.len > 15)
		if(message_cooldown < world.time)
			visible_message(span_notice("[src] looks too full to eat \the [tasty]!"))
			message_cooldown = world.time + 5 SECONDS
		return FALSE

	visible_message(span_notice("[src] hungrily gobbles up \the [tasty]!"))
	tasty.forceMove(src)
	vom.eaten_items += tasty
	playsound(src,'sound/items/eatfood.ogg', 70, TRUE)
	return TRUE

/mob/living/simple_animal/hostile/retaliate/newgoose/attackby(obj/item/O, mob/living/user)
	. = ..()
	if(user.combat_mode)
		return FALSE
	if(stat == DEAD)
		return FALSE
	feed(O)
	return TRUE

/mob/living/simple_animal/hostile/retaliate/newgoose/proc/amuse()
	playsound(src, 'sound/creatures/amusing.ogg', 50, FALSE, FALSE)
	src.visible_message(span_notice("[src] makes an amusing noise!"))

/mob/living/simple_animal/hostile/retaliate/newgoose/MoveToTarget(list/possible_targets)//Step 5, handle movement between us and our target
	stop_automated_movement = 1
	var/datum/ai_controller/controller = src.ai_controller
	if(!target || !CanAttack(target || seeking_food == 1)) //don't try to move in to attack if looking for food
		LoseTarget()
		return 0
	var/atom/target_from = GET_TARGETS_FROM(src)
	if(target in possible_targets)
		var/turf/T = get_turf(src)
		if(target.z != T.z)
			LoseTarget()
			return 0
		var/target_distance = get_dist(target_from,target)
		//whenever we try to move to attack an enemy, try to vomit at them first

		call(controller, "VomitCall")(target)
		if(ranged) //We ranged? Shoot at em
			if(!target.Adjacent(target_from) && ranged_cooldown <= world.time) //But make sure they're not in range for a melee attack and our range attack is off cooldown
				OpenFire(target)
		if(!Process_Spacemove(0)) //Drifting
			GLOB.move_manager.stop_looping(src)
			return 1
		if(retreat_distance != null) //If we have a retreat distance, check if we need to run from our target
			if(target_distance <= retreat_distance) //If target's closer than our retreat distance, run
				GLOB.move_manager.move_away(src, target, retreat_distance, move_to_delay, flags = MOVEMENT_LOOP_IGNORE_GLIDE)
			else
				Goto(target,move_to_delay,minimum_distance) //Otherwise, get to our minimum distance so we chase them
		else
			Goto(target,move_to_delay,minimum_distance)
		if(target)
			if(isturf(target_from.loc) && target.Adjacent(target_from)) //If they're next to us, attack
				MeleeAction()
			else
				if(rapid_melee > 1 && target_distance <= melee_queue_distance)
					MeleeAction(FALSE)
				in_melee = FALSE //If we're just preparing to strike do not enter sidestep mode
			return 1
		return 0
	if(environment_smash)
		if(target.loc != null && get_dist(target_from, target.loc) <= vision_range) //We can't see our target, but he's in our vision range still
			if(ranged_ignores_vision && ranged_cooldown <= world.time) //we can't see our target... but we can fire at them!
				OpenFire(target)
			if(environment_smash >= ENVIRONMENT_SMASH_WALLS) //If we're capable of smashing through walls, forget about vision completely after finding our target
				Goto(target,move_to_delay,minimum_distance)
				FindHidden()
				return 1
			else
				if(FindHidden())
					return 1
	LoseTarget()
	return 0

// Please do not add one-off mob AIs here, but override this function for your mob
/mob/living/simple_animal/hostile/retaliate/newgoose/CanAttack(atom/the_target)//Can we actually attack a possible target?
	if(seeking_food == 1) //don't try to attack while trying to eat something
		//src.visible_message(span_notice("DEBUG: [src] wanted to attack, but it was looking for food!"))
		return FALSE

	if(!isatom(the_target))
		stack_trace("Invalid target in CanAttack(): [the_target]")
		return FALSE

	if(isturf(the_target) || QDELETED(the_target) || QDELETED(src)) // bail out on invalids
		return FALSE

	if(ismob(the_target)) //Target is in godmode, ignore it.
		var/mob/M = the_target
		if(M.status_flags & GODMODE)
			return FALSE

	if(see_invisible < the_target.invisibility)//Target's invisible to us, forget it
		return FALSE
	if(search_objects < 2)
		if(isliving(the_target))
			var/mob/living/L = the_target
			var/faction_check = faction_check_atom(L)
			if(robust_searching)
				if(faction_check && !attack_same)
					return FALSE
				if(L.stat > stat_attack)
					return FALSE
				if(L in friends)
					return FALSE
			else
				if((faction_check && !attack_same) || L.stat)
					return FALSE
			return TRUE

		if(ismecha(the_target))
			var/obj/vehicle/sealed/mecha/M = the_target
			for(var/occupant in M.occupants)
				if(CanAttack(occupant))
					return TRUE

		if(istype(the_target, /obj/machinery/porta_turret))
			var/obj/machinery/porta_turret/P = the_target
			if(P.in_faction(src)) //Don't attack if the turret is in the same faction
				return FALSE
			if(P.has_cover && !P.raised) //Don't attack invincible turrets
				return FALSE
			if(P.machine_stat & BROKEN) //Or turrets that are already broken
				return FALSE
			return TRUE

	if(isobj(the_target))
		if(attack_all_objects || is_type_in_typecache(the_target, wanted_objects))
			return TRUE

	return FALSE

/mob/living/simple_animal/hostile/retaliate/newgoose/Initialize(mapload)
	. = ..()
	var/datum/action/cooldown/mob_cooldown/vomitGoose/vomit = new(src)
	vomit.Grant(src)
	ai_controller.set_blackboard_key(BB_VOMIT_ABILITY, vomit)


/datum/action/cooldown/mob_cooldown/vomitGoose
	name = "Vomit"
	desc = "Attempts to projectile vomit a consumed item."
	cooldown_time = 2 SECONDS
	click_to_activate = TRUE
	var/list/eaten_items = list()
	var/items_only = 1 //1+ only lets you eat items. 0 lets you eat all objs and mobs. -1 removes all atom restrictions

/datum/action/cooldown/mob_cooldown/vomitGoose/set_click_ability(mob/on_who)
	. = ..() //i don't know what this does
	if(!.) //or this
		return //or this

	to_chat(on_who, span_notice("Your mouth waters in anticipation. <b>Right-click on an item to eat it. Left-click to vomit.</b>"))

/datum/action/cooldown/mob_cooldown/vomitGoose/unset_click_ability(mob/on_who, refund_cooldown = TRUE)
	. = ..()
	if(!.)
		return

	if(refund_cooldown)
		to_chat(on_who, span_notice("You stop salivating."))


//all of the improved vomit ability code follows. this can be used on any mob, not just geese
/datum/action/cooldown/mob_cooldown/vomitGoose/proc/gag(mob/living/caller)
	caller.visible_message(span_notice("[caller] gags violently, but does not vomit!"))
	playsound(get_turf(caller), 'sound/creatures/vomitgag.ogg', 50, TRUE)
	StartCooldown()
	return TRUE

/datum/action/cooldown/mob_cooldown/vomitGoose/proc/vom(mob/living/caller, atom/cast_on)
	var/obj/item/consumed = pick(eaten_items)
	consumed.forceMove(get_turf(caller))
	eaten_items -= consumed

	playsound(get_turf(caller), 'sound/creatures/projvom.ogg', 50, TRUE)

	consumed.throw_at(cast_on, 10, 5, caller, spin = TRUE)
	sleep(0.2 SECONDS)
	if (QDELETED(src) || QDELETED(consumed))
		return
	var/turf/currentTurf = get_turf(consumed)
	currentTurf.add_vomit_floor(owner)
	playsound(currentTurf, 'sound/effects/splat.ogg', 50, TRUE)
	if(istype(caller,/mob/living/simple_animal/hostile/retaliate/newgoose))
		vomitanim(caller)
	caller.visible_message(span_notice("[caller] projectile vomits \the [consumed]!"))

	StartCooldown()
	return TRUE

/datum/action/cooldown/mob_cooldown/vomitGoose/proc/vomitanim(mob/living/caller)
	//caller.icon_state = "vomit_start"
	//sleep(13)
	caller.icon_state = "vomit"
	sleep(25)
	caller.icon_state = "vomit_end"
	sleep(13)
	caller.icon_state = "goose"

/datum/action/cooldown/mob_cooldown/vomitGoose/proc/eat(mob/living/caller, atom/cast_on)
	caller.visible_message(span_notice("[caller] hungrily gobbles up \the [cast_on]!"))
	playsound(caller,'sound/items/eatfood.ogg', 70, TRUE)
	caller.contents += cast_on
	eaten_items += cast_on
	StartCooldown()
	return

/datum/action/cooldown/mob_cooldown/vomitGoose/InterceptClickOn(mob/living/simple_animal/hostile/retaliate/newgoose/caller, params, atom/cast_on)
	//var/turf/currentTurf = get_turf(caller)

	//is an ai calling us (no client key)? handle it in such a way that clicks are not used, b/c idk how to make ai right click
	if(caller.client == null)
		//caller.visible_message(span_notice("DEBUG: [caller] AI has begun vomit ability!"))
		if(istype(cast_on,/mob)) //if this is a mob, then gag if we have no eaten items, or else vomit at them
			//caller.visible_message(span_notice("DEBUG: [caller] AI has tried to vomit at mob [cast_on]!"))
			if (!(eaten_items.len > 0))
				//caller.visible_message(span_notice("DEBUG: [caller] AI is gagging!"))
				gag(caller)
				return TRUE
			else
				vom(caller, cast_on)
				//caller.visible_message(span_notice("DEBUG: [caller] AI is trying to vomit at [cast_on]!"))
				return TRUE
		//caller.visible_message(span_notice("DEBUG: [caller] stopped looking for food!"))
		caller.seeking_food = 0 //if we aren't vomiting at an enemy, we're trying to get food. stop seeking whether we manage to eat it or not
		if(caller.Adjacent(cast_on)) //check we're adjacent to item
			eat(caller, cast_on) //if it is anything but a mob, then eat it. no atom check needed; ai will only target objs
			return TRUE
		//caller.visible_message(span_notice("DEBUG: [caller] AI has failed vomit proc!"))
		return TRUE

	//if right click, go through process for trying to eat item
	if(LAZYACCESS(params2list(params), RIGHT_CLICK))
		if(!caller.Adjacent(cast_on))
			caller.balloon_alert(caller, "must be closer!")
			return TRUE
		if(cast_on == caller)
			caller.balloon_alert(caller, "can't eat self!")
			return TRUE
		if((!istype(cast_on,/obj/item))&&items_only>0)
			caller.balloon_alert(caller, "not an item!")
			return TRUE
		if(items_only > 0) //anchor check. only run if items_only is set to default (>0)
			/var/obj/tempCast //anchored is an obj specific var, so we do this dumb shit
			tempCast = cast_on
			if(tempCast.anchored > 0)
				caller.balloon_alert(caller, "can't move it!")
				return TRUE
		if((!istype(cast_on,/obj))&&(!istype(cast_on,/mob))&&items_only>-0.1)
			to_chat(caller, span_notice("Even <i>you</i> can't eat that."))
			return TRUE
		eat(caller, cast_on)
		return TRUE

	//if you don't have any eaten items, just gag instead
	if (!(eaten_items.len > 0))
		gag(caller)
		return TRUE

	//if left click and have items, vomit at target
	vom(caller, cast_on)
	return TRUE
