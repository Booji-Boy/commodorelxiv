///How confused a carbon must be before they will vomit
#define BEYBLADE_PUKE_THRESHOLD (30 SECONDS)
///How must nutrition is lost when a carbon pukes
#define BEYBLADE_PUKE_NUTRIENT_LOSS 60
///How often a carbon becomes penalized
#define BEYBLADE_DIZZINESS_PROBABILITY 20
///How long the screenshake lasts
#define BEYBLADE_DIZZINESS_DURATION (20 SECONDS)
///How much confusion a carbon gets every time they are penalized
#define BEYBLADE_CONFUSION_INCREMENT (10 SECONDS)
///A max for how much confusion a carbon will be for beyblading
#define BEYBLADE_CONFUSION_LIMIT (40 SECONDS)

//The code execution of the emote datum is located at code/datums/emotes.dm
/mob/proc/emote(act, m_type = null, message = null, intentional = FALSE, force_silence = FALSE)
	var/param = message
	var/custom_param = findchar(act, " ")
	if(custom_param)
		param = copytext(act, custom_param + length(act[custom_param]))
		act = copytext(act, 1, custom_param)

	act = lowertext(act)
	var/list/key_emotes = GLOB.emote_list[act]

	if(!length(key_emotes))
		if(intentional && !force_silence)
			to_chat(src, span_notice("'[act]' emote does not exist. Say *help for a list."))
		return FALSE
	var/silenced = FALSE
	for(var/datum/emote/P in key_emotes)
		if(!P.check_cooldown(src, intentional))
			silenced = TRUE
			continue
		if(P.run_emote(src, param, m_type, intentional))
			SEND_SIGNAL(src, COMSIG_MOB_EMOTE, P, act, m_type, message, intentional)
			SEND_SIGNAL(src, COMSIG_MOB_EMOTED(P.key))
			return TRUE
	if(intentional && !silenced && !force_silence)
		to_chat(src, span_notice("Unusable emote '[act]'. Say *help for a list."))
	return FALSE

/datum/emote/help
	key = "help"
	mob_type_ignore_stat_typecache = list(/mob/dead/observer, /mob/living/silicon/ai, /mob/camera/imaginary_friend)

/datum/emote/help/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	var/list/keys = list()
	var/list/message = list("Available emotes, you can use them with say [span_bold("\"*emote\"")]: \n")
	message += span_smallnoticeital("Note - emotes highlighted in blue play a sound \n\n")

	for(var/key in GLOB.emote_list)
		for(var/datum/emote/emote_action in GLOB.emote_list[key])
			if(emote_action.key in keys)
				continue
			if(emote_action.can_run_emote(user, status_check = FALSE , intentional = TRUE))
				keys += emote_action.key

	keys = sort_list(keys)

	// the span formatting will mess up sorting so need to do it afterwards
	for(var/i in 1 to keys.len)
		for(var/datum/emote/emote_action in GLOB.emote_list[keys[i]])
			if(emote_action.get_sound(user) && emote_action.should_play_sound(user, intentional = TRUE))
				keys[i] = span_boldnotice(keys[i])

	message += keys.Join(", ")
	message += "."
	message = message.Join("")
	to_chat(user, examine_block(message))

/datum/emote/flip
	key = "flip"
	key_third_person = "flips"
	hands_use_check = TRUE
	mob_type_allowed_typecache = list(/mob/living, /mob/dead/observer, /mob/camera/imaginary_friend)
	mob_type_ignore_stat_typecache = list(/mob/dead/observer, /mob/living/silicon/ai, /mob/camera/imaginary_friend)

/datum/emote/flip/run_emote(mob/user, params , type_override, intentional)
	. = ..()
	if(.)
		user.SpinAnimation(7,1)

/datum/emote/flip/check_cooldown(mob/user, intentional)
	. = ..()
	if(.)
		return
	if(!can_run_emote(user, intentional=intentional))
		return
	if(isliving(user))
		var/mob/living/flippy_mcgee = user
		if(prob(20))
			flippy_mcgee.Knockdown(1 SECONDS)
			flippy_mcgee.visible_message(
				span_notice("[flippy_mcgee] attempts to do a flip and falls over, what a doofus!"),
				span_notice("You attempt to do a flip while still off balance from the last flip and fall down!")
			)
			if(prob(50))
				flippy_mcgee.adjustBruteLoss(1)
		else
			flippy_mcgee.visible_message(
				span_notice("[flippy_mcgee] stumbles a bit after their flip."),
				span_notice("You stumble a bit from still being off balance from your last flip.")
			)

// poo fart


/datum/emote/fart
	key = "fart"
	key_third_person = "farts"
	hands_use_check = TRUE
	mob_type_allowed_typecache = list(/mob/living, /mob/camera/imaginary_friend)
	mob_type_ignore_stat_typecache = list(/mob/dead/observer, /mob/living/silicon/ai, /mob/camera/imaginary_friend)

/datum/emote/fart/run_emote(mob/user, params , type_override, intentional)
	. = ..()
	var/mob/living/flippy_mcgee = user
	var/list/fartsounds = list('sound/misc/wetfart.ogg', 'sound/misc/fartmassive.ogg', 'sound/misc/fart.ogg')

	if(.)
		if(prob(4))
			flippy_mcgee.visible_message(
				span_notice("[flippy_mcgee] tries to fart, but accidentally sharts."),
				span_notice("You try to fart, but it's wetter than you thought it would be!")
			)
			playsound(flippy_mcgee.loc, 'sound/misc/wetfart.ogg', 50, 1)
			new /mob/living/basic/poo(flippy_mcgee.loc)
		else
			var/list/farts = list("farts.","passes wind.","toots.","farts [pick("lightly", "tenderly", "softly", "with care")].","farts with the force of one thousand suns.")
			var/fart = pick(farts)
			flippy_mcgee.visible_message(span_notice("[flippy_mcgee] [fart]"))
			playsound(flippy_mcgee.loc, pick(fartsounds), 50, 1)

/datum/emote/poo
	key = "poo"
	key_third_person = "shits"
	hands_use_check = TRUE
	mob_type_allowed_typecache = list(/mob/living, /mob/camera/imaginary_friend)
	mob_type_ignore_stat_typecache = list(/mob/dead/observer, /mob/living/silicon/ai, /mob/camera/imaginary_friend)

/datum/emote/poo/run_emote(mob/user, params , type_override, intentional)
	//. = ..()
	//if(!can_run_emote(user, intentional=intentional))
	//	return
	//if(isliving(user))
	. = ..()
	var/mob/living/flippy_mcgee = user
	var/list/fartsounds = list('sound/misc/wetfart.ogg', 'sound/misc/fartmassive.ogg', 'sound/misc/fart.ogg')

	if(intentional && flippy_mcgee.nutrition < 81) // no pooping if you are hungry
		to_chat(flippy_mcgee, span_notice("You don't need to go right now."))
		return

	if(!intentional && flippy_mcgee.nutrition < 81) //if you are forced to poop while hungry, shit blood + 5 brute dmg
		//span_notice("[flippy_mcgee] screams and squirts blood out their asshole!"),
		//span_notice("Your empty bowels clench painfully as you try to shit, and blood squirts out your asshole!")
		user.visible_message(span_notice("[flippy_mcgee] screams and squirts blood out their asshole!"))
		to_chat(user, span_warning("Your empty bowels clench painfully as you try to shit, and blood squirts out your asshole!"))

		playsound(flippy_mcgee.loc, pick(fartsounds), 50, 1)
		flippy_mcgee.emote("scream")
		new /obj/effect/decal/cleanable/blood(flippy_mcgee.loc)
		flippy_mcgee.adjustBruteLoss(5)
		return

	if(.)
		if(prob(1))
			flippy_mcgee.visible_message(
				span_notice("[flippy_mcgee] hunches over and shits out a living pile of feces."),
				span_notice("You hunch over and shit out a living pile of feces.")
			)
			flippy_mcgee.nutrition -= 80
			playsound(flippy_mcgee.loc, 'sound/misc/wetfart.ogg', 50, 1)
			playsound(flippy_mcgee.loc, 'sound/misc/fartmassive.ogg', 50, 1)
			playsound(flippy_mcgee.loc, 'sound/effects/splat.ogg', 50, 1)
			new /mob/living/basic/poo(flippy_mcgee.loc)
		else
			var/list/poos = list("drops their pants and shits.","sprays diarrhea down their leg.","takes a dump on the floor.","casually lifts his pant leg, and a turd falls out.")
			var/poo = pick(poos)
			flippy_mcgee.visible_message(span_notice("[flippy_mcgee] [poo]"))
			playsound(flippy_mcgee.loc, pick(fartsounds), 50, 1)
			flippy_mcgee.nutrition -= 50
			new /obj/item/food/poo(flippy_mcgee.loc)


// poo fart end

/datum/emote/spin
	key = "spin"
	key_third_person = "spins"
	hands_use_check = TRUE
	mob_type_allowed_typecache = list(/mob/living, /mob/dead/observer, /mob/camera/imaginary_friend)
	mob_type_ignore_stat_typecache = list(/mob/dead/observer, /mob/camera/imaginary_friend)

/datum/emote/spin/run_emote(mob/user, params,  type_override, intentional)
	. = ..()
	if(.)
		user.spin(20, 1)

/datum/emote/spin/check_cooldown(mob/living/carbon/user, intentional)
	. = ..()
	if(.)
		return
	if(!can_run_emote(user, intentional=intentional))
		return
	if(!iscarbon(user))
		return

	if(user.get_timed_status_effect_duration(/datum/status_effect/confusion) > BEYBLADE_PUKE_THRESHOLD)
		user.vomit(VOMIT_CATEGORY_KNOCKDOWN, lost_nutrition = BEYBLADE_PUKE_NUTRIENT_LOSS, distance = 0)
		return

	if(prob(BEYBLADE_DIZZINESS_PROBABILITY))
		to_chat(user, span_warning("You feel woozy from spinning."))
		user.set_dizzy_if_lower(BEYBLADE_DIZZINESS_DURATION)
		user.adjust_confusion_up_to(BEYBLADE_CONFUSION_INCREMENT, BEYBLADE_CONFUSION_LIMIT)

#undef BEYBLADE_PUKE_THRESHOLD
#undef BEYBLADE_PUKE_NUTRIENT_LOSS
#undef BEYBLADE_DIZZINESS_PROBABILITY
#undef BEYBLADE_DIZZINESS_DURATION
#undef BEYBLADE_CONFUSION_INCREMENT
#undef BEYBLADE_CONFUSION_LIMIT
