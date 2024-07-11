SUBSYSTEM_DEF(polling)
	name = "Polling"
	flags = SS_BACKGROUND | SS_NO_INIT
	wait = 1 SECONDS
<<<<<<< HEAD
	runlevels = RUNLEVEL_GAME
=======
	runlevels = RUNLEVEL_GAME | RUNLEVEL_POSTGAME
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	/// List of polls currently ongoing, to be checked on next fire()
	var/list/datum/candidate_poll/currently_polling
	/// Number of polls performed since the start
	var/total_polls = 0

/datum/controller/subsystem/polling/fire()
	if(!currently_polling) // if polls_active is TRUE then this shouldn't happen, but still..
		currently_polling = list()

	for(var/datum/candidate_poll/running_poll as anything in currently_polling)
		if(running_poll.time_left() <= 0)
			polling_finished(running_poll)

/**
 * Starts a poll.
 *
 * Arguments
 * * question: Optional, The question to ask the candidates. If null, a default question will be used. ("Do you want to play as role?")
 * * role: Optional, An antag role (IE, ROLE_TRAITOR) to pass, it won't show to any candidates who don't have it in their preferences.
 * * check_jobban: Optional, What jobban role / flag to check, it won't show to any candidates who have this jobban.
 * * poll_time: How long the poll will last.
 * * ignore_category: Optional, A poll category. If a candidate has this category in their ignore list, they won't be polled.
 * * flash_window: If TRUE, the candidate's window will flash when they're polled.
 * * list/group: A list of candidates to poll.
<<<<<<< HEAD
 * * alert_pic: Optional, An /atom or an /image to display on the poll alert.
 * * jump_target: An /atom to teleport/jump to, if alert_pic is an /atom defaults to that.
 * * role_name_text: Optional, A string to display in logging / the (default) question. If null, the role name will be used.
 * * list/custom_response_messages: Optional, A list of strings to use as responses to the poll. If null, the default responses will be used. see __DEFINES/polls.dm for valid keys to use.
 * * start_signed_up: If TRUE, all candidates will start signed up for the poll, making it opt-out rather than opt-in.
 * * amount_to_pick: Lets you pick candidates and return a single mob or list of mobs that were chosen.
 * * chat_text_border_icon: Object or path to make an icon of to decorate the chat announcement.
 * * announce_chosen: Whether we should announce the chosen candidates in chat. This is ignored unless amount_to_pick is greater than 0.
=======
 * * pic_source: Optional, An /atom or an /image to display on the poll alert.
 * * role_name_text: Optional, A string to display in logging / the (default) question. If null, the role name will be used.
 * * list/custom_response_messages: Optional, A list of strings to use as responses to the poll. If null, the default responses will be used. see __DEFINES/polls.dm for valid keys to use.
 * * start_signed_up: If TRUE, all candidates will start signed up for the poll, making it opt-out rather than opt-in.
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
 *
 * Returns a list of all mobs who signed up for the poll.
 */
/datum/controller/subsystem/polling/proc/poll_candidates(
	question,
	role,
	check_jobban,
	poll_time = 30 SECONDS,
	ignore_category = null,
	flash_window = TRUE,
	list/group = null,
<<<<<<< HEAD
	alert_pic,
	jump_target,
	role_name_text,
	list/custom_response_messages,
	start_signed_up = FALSE,
	amount_to_pick = 0,
	chat_text_border_icon,
	announce_chosen = TRUE,
)
	if(group.len == 0)
		return
	if(role && !role_name_text)
		role_name_text = role
	if(role_name_text && !question)
		question = "Do you want to play as [span_notice(role_name_text)]?"
=======
	pic_source,
	role_name_text,
	list/custom_response_messages,
	start_signed_up = FALSE
)
	RETURN_TYPE(/list/mob)
	if(group.len == 0)
		return list()
	if(role && !role_name_text)
		role_name_text = role
	if(role_name_text && !question)
		question = "Do you want to play as [full_capitalize(role_name_text)]?"
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	if(!question)
		question = "Do you want to play as a special role?"
	log_game("Polling candidates [role_name_text ? "for [role_name_text]" : "\"[question]\""] for [DisplayTimeText(poll_time)] seconds")

	// Start firing
	total_polls++

<<<<<<< HEAD
	if(isnull(jump_target) && isatom(alert_pic))
		jump_target = alert_pic

	var/datum/candidate_poll/new_poll = new(role_name_text, question, poll_time, ignore_category, jump_target, custom_response_messages)
=======
	var/jumpable = isatom(pic_source) ? pic_source : null

	var/datum/candidate_poll/new_poll = new(role_name_text, question, poll_time, ignore_category, jumpable, custom_response_messages)
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	LAZYADD(currently_polling, new_poll)

	var/category = "[new_poll.poll_key]_poll_alert"

	for(var/mob/candidate_mob as anything in group)
		if(!candidate_mob.client)
			continue
<<<<<<< HEAD
		// Universal opt-out for all players.
		if(!candidate_mob.client.prefs.read_preference(/datum/preference/toggle/ghost_roles))
			continue
		// Opt-out for admins whom are currently adminned.
		if((!candidate_mob.client.prefs.read_preference(/datum/preference/toggle/ghost_roles_as_admin)) && candidate_mob.client.holder)
			continue
=======
		// Universal opt-out for all players if it's for a role.
		if(!candidate_mob.client.prefs.read_preference(/datum/preference/toggle/ghost_roles))
			continue
		// Opt-out for admins whom are currently adminned.
		if(!candidate_mob.client.prefs.read_preference(/datum/preference/toggle/ghost_roles_as_admin) && candidate_mob.client.holder)
			continue
		// Eligibility check (checks jobbans, prefs, and ignore categories)
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
		if(!is_eligible(candidate_mob, role, check_jobban, ignore_category))
			continue

		if(start_signed_up)
			new_poll.sign_up(candidate_mob, TRUE)
		if(flash_window)
			window_flash(candidate_mob.client)

		// If we somehow send two polls for the same mob type, but with a duration on the second one shorter than the time left on the first one,
		// we need to keep the first one's timeout rather than use the shorter one
		var/atom/movable/screen/alert/poll_alert/current_alert = LAZYACCESS(candidate_mob.alerts, category)
		var/alert_time = poll_time
		var/datum/candidate_poll/alert_poll = new_poll
		if(current_alert && current_alert.timeout > (world.time + poll_time - world.tick_lag))
			alert_time = current_alert.timeout - world.time + world.tick_lag
			alert_poll = current_alert.poll

		// Send them an on-screen alert
		var/atom/movable/screen/alert/poll_alert/poll_alert_button = candidate_mob.throw_alert(category, /atom/movable/screen/alert/poll_alert, timeout_override = alert_time, no_anim = TRUE)
		if(!poll_alert_button)
			continue

		new_poll.alert_buttons += poll_alert_button
		new_poll.RegisterSignal(poll_alert_button, COMSIG_QDELETING, TYPE_PROC_REF(/datum/candidate_poll, clear_alert_ref))

		poll_alert_button.icon = ui_style2icon(candidate_mob.client?.prefs?.read_preference(/datum/preference/choiced/ui_style))
		poll_alert_button.desc = "[question]"
		poll_alert_button.show_time_left = TRUE
		poll_alert_button.poll = alert_poll
		poll_alert_button.set_role_overlay()
		poll_alert_button.update_stacks_overlay()
		poll_alert_button.update_candidates_number_overlay()
		poll_alert_button.update_signed_up_overlay()


		// Sign up inheritance and stacking
		for(var/datum/candidate_poll/other_poll as anything in currently_polling)
			if(new_poll == other_poll || new_poll.poll_key != other_poll.poll_key)
				continue
			// If there's already a poll for an identical mob type ongoing and the client is signed up for it, sign them up for this one
			if((candidate_mob in other_poll.signed_up) && new_poll.sign_up(candidate_mob, TRUE))
				break

<<<<<<< HEAD
		// Image to display
		var/image/poll_image
		if(ispath(alert_pic, /atom))
			poll_image = image(alert_pic)
		else if(isatom(alert_pic))
			poll_image = new /mutable_appearance(alert_pic)
		else if(!isnull(alert_pic))
			poll_image = alert_pic
		else
			poll_image = image('icons/effects/effects.dmi', icon_state = "static")

		if(poll_image)
			poll_image.layer = FLOAT_LAYER
=======
		var/image/poll_image
		if(pic_source)
			if(isatom(pic_source))
				var/atom/the_pic_source = pic_source
				var/old_layer = the_pic_source.layer
				var/old_plane = the_pic_source.plane
				the_pic_source.plane = poll_alert_button.plane
				the_pic_source.layer = FLOAT_LAYER
				poll_alert_button.add_overlay(the_pic_source)
				the_pic_source.layer = old_layer
				the_pic_source.plane = old_plane
			else if(ispath(pic_source, /datum/antagonist))
				var/datum/antagonist/antagonist = new pic_source
				poll_image = antagonist.render_poll_preview() || image('icons/effects/effects.dmi', icon_state = "static", layer = FLOAT_LAYER)
				qdel(antagonist)
			else
				poll_image = image(pic_source, layer = FLOAT_LAYER)
		else
			// Just use a generic image
			poll_image = image('icons/effects/effects.dmi', icon_state = "static", layer = FLOAT_LAYER)

		if(poll_image)
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
			poll_image.plane = poll_alert_button.plane
			poll_alert_button.add_overlay(poll_image)

		// Chat message
		var/act_jump = ""
<<<<<<< HEAD
		var/custom_link_style_start = "<style>a:visited{color:Crimson !important}</style>"
		var/custom_link_style_end = "style='color:DodgerBlue;font-weight:bold;-dm-text-outline: 1px black'"
		if(isatom(alert_pic) && isobserver(candidate_mob))
			act_jump = "[custom_link_style_start]<a href='?src=[REF(poll_alert_button)];jump=1'[custom_link_style_end]>\[Teleport\]</a>"
		var/act_signup = "[custom_link_style_start]<a href='?src=[REF(poll_alert_button)];signup=1'[custom_link_style_end]>\[[start_signed_up ? "Opt out" : "Sign Up"]\]</a>"
		var/act_never = ""
		if(ignore_category)
			act_never = "[custom_link_style_start]<a href='?src=[REF(poll_alert_button)];never=1'[custom_link_style_end]>\[Never For This Round\]</a>"

		if(!duplicate_message_check(alert_poll)) //Only notify people once. They'll notice if there are multiple and we don't want to spam people.
			SEND_SOUND(candidate_mob, 'sound/misc/notice2.ogg')
			var/surrounding_icon
			if(chat_text_border_icon)
				var/image/surrounding_image
				if(!ispath(chat_text_border_icon))
					var/mutable_appearance/border_image = chat_text_border_icon
					surrounding_image = border_image
				else
					surrounding_image = image(chat_text_border_icon)
				surrounding_icon = icon2html(surrounding_image, candidate_mob, extra_classes = "bigicon")
			var/final_message =  examine_block("<span style='text-align:center;display:block'>[surrounding_icon] <span style='font-size:1.2em'>[span_ooc(question)]</span> [surrounding_icon]\n[act_jump]      [act_signup]      [act_never]</span>")
			to_chat(candidate_mob, final_message)
=======
		if(isatom(pic_source) && isobserver(candidate_mob))
			act_jump = "<a href='?src=[REF(poll_alert_button)];jump=1'>\[Teleport\]</a>"
		var/act_signup = "<a href='?src=[REF(poll_alert_button)];signup=1'>\[[start_signed_up ? "Opt out" : "Sign Up"]\]</a>"
		var/act_never = ""
		if(ignore_category)
			act_never = "<a href='?src=[REF(poll_alert_button)];never=1'>\[Never For This Round\]</a>"

		if(!duplicate_message_check(alert_poll) && candidate_mob.client) //Only notify people once. They'll notice if there are multiple and we don't want to spam people.
			SEND_SOUND(candidate_mob.client, sound('sound/misc/notice2.ogg', volume = candidate_mob.client.prefs.channel_volume["[CHANNEL_SOUND_EFFECTS]"]))
			to_chat(candidate_mob, span_boldnotice(examine_block("Now looking for candidates [role_name_text ? "to play as \an [role_name_text]." : "\"[question]\""] [act_jump] [act_signup] [act_never]")))
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

		// Start processing it so it updates visually the timer
		START_PROCESSING(SSprocessing, poll_alert_button)

	// Sleep until the time is up
	UNTIL(new_poll.finished)
<<<<<<< HEAD
	if(!(amount_to_pick > 0))
		return new_poll.signed_up
	for(var/pick in 1 to amount_to_pick)
		new_poll.chosen_candidates += pick_n_take(new_poll.signed_up)
	if(announce_chosen)
		new_poll.announce_chosen(group)
	if(new_poll.chosen_candidates.len == 1)
		var/chosen_one = pick(new_poll.chosen_candidates)
		return chosen_one
	return new_poll.chosen_candidates

/datum/controller/subsystem/polling/proc/poll_ghost_candidates(
	question,
	role,
	check_jobban,
	poll_time = 30 SECONDS,
	ignore_category = null,
	flashwindow = TRUE,
	alert_pic,
	jump_target,
	role_name_text,
	list/custom_response_messages,
	start_signed_up = FALSE,
	amount_to_pick = 0,
	chat_text_border_icon,
	announce_chosen = TRUE,
)
	var/list/candidates = list()
	if(!(GLOB.ghost_role_flags & GHOSTROLE_STATION_SENTIENCE))
		return
	for(var/mob/dead/observer/ghost_player in GLOB.player_list)
		candidates += ghost_player
	return poll_candidates(question, role, check_jobban, poll_time, ignore_category, flashwindow, candidates, alert_pic, jump_target, role_name_text, custom_response_messages, start_signed_up, amount_to_pick, chat_text_border_icon, announce_chosen)

/datum/controller/subsystem/polling/proc/poll_ghosts_for_target(
	question,
	role,
	check_jobban,
	poll_time = 30 SECONDS,
	atom/movable/checked_target,
	ignore_category = null,
	flashwindow = TRUE,
	alert_pic,
	jump_target,
	role_name_text,
	list/custom_response_messages,
	start_signed_up = FALSE,
	chat_text_border_icon,
	announce_chosen = TRUE,
)
	var/static/list/atom/movable/currently_polling_targets = list()
	if(currently_polling_targets.Find(checked_target))
		return
	currently_polling_targets += checked_target
	var/mob/chosen_one = poll_ghost_candidates(question, role, check_jobban, poll_time, ignore_category, flashwindow, alert_pic, jump_target, role_name_text, custom_response_messages, start_signed_up, amount_to_pick = 1, chat_text_border_icon = chat_text_border_icon, announce_chosen = announce_chosen)
	currently_polling_targets -= checked_target
	if(!checked_target || QDELETED(checked_target) || !checked_target.loc)
		return null
	return chosen_one

/datum/controller/subsystem/polling/proc/poll_ghosts_for_targets(
	question,
	role,
	check_jobban,
	poll_time = 30 SECONDS,
	list/checked_targets,
	ignore_category = null,
	flashwindow = TRUE,
	alert_pic,
	jump_target,
	role_name_text,
	list/custom_response_messages,
	start_signed_up = FALSE,
	chat_text_border_icon,
)
	var/list/candidate_list = poll_ghost_candidates(question, role, check_jobban, poll_time, ignore_category, flashwindow, alert_pic, jump_target, role_name_text, custom_response_messages, start_signed_up, chat_text_border_icon = chat_text_border_icon)
	for(var/atom/movable/potential_target as anything in checked_targets)
		if(QDELETED(potential_target) || !potential_target.loc)
			checked_targets -= potential_target
	if(!length(checked_targets))
		return list()
=======
	return new_poll.signed_up

/datum/controller/subsystem/polling/proc/poll_ghost_candidates(question, role, check_jobban, poll_time = 30 SECONDS, ignore_category = null, flashwindow = TRUE, pic_source, role_name_text)
	var/list/candidates = list()
	if(!(GLOB.ghost_role_flags & GHOSTROLE_STATION_SENTIENCE))
		return candidates

	for(var/mob/dead/observer/ghost_player in GLOB.player_list)
		candidates += ghost_player

	return poll_candidates(question, role, check_jobban, poll_time, ignore_category, flashwindow, candidates, pic_source, role_name_text)

/datum/controller/subsystem/polling/proc/poll_ghost_candidates_for_mob(question, role, check_jobban, poll_time = 30 SECONDS, mob/target_mob, ignore_category = null, flashwindow = TRUE, pic_source, role_name_text)
	var/static/list/mob/currently_polling_mobs = list()

	if(!isnull(target_mob) && !ismob(target_mob))
		stack_trace("attempted to use a non-mob as the target mob ([target_mob] | [target_mob.type])")

	if(currently_polling_mobs.Find(target_mob))
		return list()

	if(!pic_source && target_mob)
		pic_source = target_mob

	currently_polling_mobs += target_mob

	var/list/possible_candidates = poll_ghost_candidates(question, role, check_jobban, poll_time, ignore_category, flashwindow, pic_source, role_name_text)

	currently_polling_mobs -= target_mob
	if(!target_mob || QDELETED(target_mob) || !target_mob.loc)
		return list()

	return possible_candidates

/datum/controller/subsystem/polling/proc/poll_ghost_candidates_for_mobs(question, role, check_jobban, poll_time = 30 SECONDS, list/mobs, ignore_category = null, flashwindow = TRUE, pic_source, role_name_text)
	var/list/candidate_list = poll_ghost_candidates(question, role, check_jobban, poll_time, ignore_category, flashwindow, pic_source, role_name_text)

	for(var/mob/potential_mob as anything in mobs)
		if(QDELETED(potential_mob) || !potential_mob.loc)
			mobs -= potential_mob

	if(!length(mobs))
		return list()

>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	return candidate_list

/datum/controller/subsystem/polling/proc/is_eligible(mob/potential_candidate, role, check_jobban, the_ignore_category)
	if(isnull(potential_candidate.key) || isnull(potential_candidate.client))
		return FALSE
	if(the_ignore_category)
		if(potential_candidate.ckey in GLOB.poll_ignore[the_ignore_category])
			return FALSE
	if(role)
		if(!(role in potential_candidate.client.prefs.be_special))
			return FALSE
		var/required_time = GLOB.special_roles[role] || 0
		if(potential_candidate.client && potential_candidate.client.get_remaining_days(required_time) > 0)
			return FALSE

<<<<<<< HEAD
=======
	if(isnull(check_jobban) || !isnull(role))
		check_jobban = role
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	if(check_jobban)
		if(is_banned_from(potential_candidate.ckey, list(check_jobban, ROLE_SYNDICATE)))
			return FALSE

	return TRUE

/datum/controller/subsystem/polling/proc/polling_finished(datum/candidate_poll/finishing_poll)
	currently_polling -= finishing_poll
	// Trim players who aren't eligible anymore
	var/length_pre_trim = length(finishing_poll.signed_up)
	finishing_poll.trim_candidates()
	log_game("Candidate poll [finishing_poll.role ? "for [finishing_poll.role]" : "\"[finishing_poll.question]\""] finished. [length_pre_trim] players signed up, [length(finishing_poll.signed_up)] after trimming")
	finishing_poll.finished = TRUE

	// Take care of updating the remaining screen alerts if a similar poll is found, or deleting them.
	if(length(finishing_poll.alert_buttons))
		for(var/atom/movable/screen/alert/poll_alert/alert as anything in finishing_poll.alert_buttons)
			if(duplicate_message_check(finishing_poll))
				alert.update_stacks_overlay()
			else
				alert.owner.clear_alert("[finishing_poll.poll_key]_poll_alert")

	//More than enough time for the the `UNTIL()` stopping loop in `poll_candidates()` to be over, and the results to be turned in.
	QDEL_IN(finishing_poll, 0.5 SECONDS)

/datum/controller/subsystem/polling/stat_entry(msg)
	msg += "Active: [length(currently_polling)] | Total: [total_polls]"
	var/datum/candidate_poll/soonest_to_complete = get_next_poll_to_finish()
	if(soonest_to_complete)
		msg += " | Next: [DisplayTimeText(soonest_to_complete.time_left())] ([length(soonest_to_complete.signed_up)] candidates)"
	return ..()

///Is there a multiple of the given event type running right now?
/datum/controller/subsystem/polling/proc/duplicate_message_check(datum/candidate_poll/poll_to_check)
	for(var/datum/candidate_poll/running_poll as anything in currently_polling)
		if((running_poll.poll_key == poll_to_check.poll_key && running_poll != poll_to_check) && running_poll.time_left() > 0)
			return TRUE
	return FALSE

/datum/controller/subsystem/polling/proc/get_next_poll_to_finish()
	var/lowest_time_left = INFINITY
	var/next_poll_to_finish
	for(var/datum/candidate_poll/poll as anything in currently_polling)
		var/time_left = poll.time_left()
		if(time_left >= lowest_time_left)
			continue
		lowest_time_left = time_left
		next_poll_to_finish = poll

	if(isnull(next_poll_to_finish))
		return FALSE

	return next_poll_to_finish
