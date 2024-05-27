//poo
/mob/living/basic/poo
	name = "poo"
	desc = "A fat poo."
	icon_state = "poostand"
	icon_living = "poostand"
	icon_dead = "poolie"
	icon_gib = "poolie"
	gender = MALE
	mob_biotypes = MOB_ORGANIC | MOB_BEAST
	speak_emote = list("Frrrrt!","Frrt!","Frrrrt frrrt frrrrrrt!")
	butcher_results = list(/obj/item/food/poo = 6)
	response_help_continuous  = "licks"
	response_help_simple  = "lick"
	response_disarm_continuous = "puts their hands into the "
	response_disarm_simple = "puts your hands into the "
	response_harm_continuous   = "takes a bite out of"
	response_harm_simple   = "take a bite out of"
	attack_verb_continuous = "takes a bite out of"
	attack_verb_simple = "take a bite out of"
	attack_sound = 'sound/weapons/punch1.ogg'
	attack_vis_effect = ATTACK_EFFECT_KICK
	melee_damage_lower = 1
	melee_damage_upper = 2
	health = 50
	maxHealth = 50
	gold_core_spawnable = FRIENDLY_SPAWN
	blood_volume = BLOOD_VOLUME_NORMAL
	ai_controller = /datum/ai_controller/basic_controller/poo

/mob/living/basic/poo/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/pet_bonus, "sharts!")
	AddElement(/datum/element/ai_retaliate)
	AddElement(/datum/element/ai_flee_while_injured)
	make_tameable()

///wrapper for the tameable component addition so you can have non tamable cow subtypes
/mob/living/basic/poo/proc/make_tameable()
	AddComponent(/datum/component/tameable, food_types = list(/obj/item/food/poo), tame_chance = 25, bonus_tame_chance = 15)

/mob/living/basic/poo/tamed(mob/living/tamer, atom/food)
	can_buckle = TRUE
	buckle_lying = 0
	AddElement(/datum/element/ridable, /datum/component/riding/creature/pig)
	visible_message(span_notice("[src] farts respectfully."))

/datum/ai_controller/basic_controller/poo
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
	)

	ai_traits = STOP_MOVING_WHEN_PULLED
	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk

	planning_subtrees = list(
		/datum/ai_planning_subtree/find_nearest_thing_which_attacked_me_to_flee,
		/datum/ai_planning_subtree/flee_target,
		/datum/ai_planning_subtree/target_retaliate,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
		// /datum/ai_planning_subtree/random_speech/poo,
	)