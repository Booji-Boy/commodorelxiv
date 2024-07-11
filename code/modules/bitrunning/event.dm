/datum/round_event_control/bitrunning_glitch
	name = "Spawn Bitrunning Glitch"
	admin_setup = list(
		/datum/event_admin_setup/minimum_candidate_requirement/bitrunning_glitch,
		/datum/event_admin_setup/listed_options/bitrunning_glitch,
	)
	category = EVENT_CATEGORY_INVASION
	description = "Causes a short term antagonist to spawn in the virtual domain."
	dynamic_should_hijack = FALSE
<<<<<<< HEAD
	min_players = 1
	max_occurrences = 0
	typepath = /datum/round_event/ghost_role/bitrunning_glitch
	weight = 100
	/// List of servers on the station
	var/list/datum/weakref/active_servers = list()

/datum/round_event_control/bitrunning_glitch/can_spawn_event(players_amt, allow_magic = FALSE)
=======
	max_occurrences = 5
	min_players = 1
	typepath = /datum/round_event/ghost_role/bitrunning_glitch
	weight = 10
	/// List of active servers to choose from
	var/list/obj/machinery/quantum_server/active_servers = list()
	/// List of possible antags to spawn
	var/static/list/possible_antags = list(
		ROLE_CYBER_POLICE,
	)

/datum/round_event_control/bitrunning_glitch/can_spawn_event(players_amt, allow_magic = FALSE, fake_check = FALSE)
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	. = ..()
	if(!.)
		return .

	active_servers.Cut()

<<<<<<< HEAD
	validate_servers()
=======
	get_active_servers()
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

	if(length(active_servers))
		return TRUE

/// All servers currently running, has players in it, and map has valid mobs
<<<<<<< HEAD
/datum/round_event_control/bitrunning_glitch/proc/validate_servers()
	active_servers.Cut()
	for(var/obj/machinery/quantum_server/server in SSmachines.get_machines_by_type(/obj/machinery/quantum_server))
		if(server.validate_mutation_candidates())
			active_servers.Add(WEAKREF(server))
=======
/datum/round_event_control/bitrunning_glitch/proc/get_active_servers()
	for(var/obj/machinery/quantum_server/server in SSmachines.get_machines_by_type(/obj/machinery/quantum_server))
		if(length(server.get_valid_domain_targets()))
			active_servers.Add(server)
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

	return length(active_servers) > 0

/datum/event_admin_setup/listed_options/bitrunning_glitch
	input_text = "Select a role to spawn."

/datum/event_admin_setup/listed_options/bitrunning_glitch/get_list()
<<<<<<< HEAD
	var/list/available = list("Random")
	available += subtypesof(/datum/antagonist/bitrunning_glitch)

	return available
=======
	var/datum/round_event_control/bitrunning_glitch/control = event_control

	var/list/possible = control.possible_antags.Copy() // this seems pedantic but byond is complaining control was unused

	possible += list("Random")

	return possible
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

/datum/event_admin_setup/listed_options/bitrunning_glitch/apply_to_event(datum/round_event/ghost_role/bitrunning_glitch/event)
	if(chosen == "Random")
		event.forced_role = null
	else
		event.forced_role = chosen

/datum/event_admin_setup/minimum_candidate_requirement/bitrunning_glitch
<<<<<<< HEAD
	output_text = "There must be valid mobs to mutate!"

/datum/event_admin_setup/minimum_candidate_requirement/bitrunning_glitch/count_candidates()
	var/datum/round_event_control/bitrunning_glitch/cyber_control = event_control

	cyber_control.validate_servers()

	var/total = 0
	for(var/datum/weakref/server_ref in cyber_control.active_servers)
		var/obj/machinery/quantum_server/server = server_ref?.resolve()
		if(isnull(server))
			continue

=======
	output_text = "There must be valid mobs to mutate or players in the domain!"

/datum/event_admin_setup/minimum_candidate_requirement/bitrunning_glitch/count_candidates()
	var/datum/round_event_control/bitrunning_glitch/cyber_control = event_control
	cyber_control.get_active_servers()

	var/total = 0
	for(var/obj/machinery/quantum_server/server in cyber_control.active_servers)
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
		total += length(server.mutation_candidate_refs)

	return total

/datum/round_event/ghost_role/bitrunning_glitch
	minimum_required = 1
	role_name = "Bitrunning Glitch"
	fakeable = FALSE
	/// Admin customization: What to spawn
	var/forced_role

/datum/round_event/ghost_role/bitrunning_glitch/spawn_role()
	var/datum/round_event_control/bitrunning_glitch/cyber_control = control
<<<<<<< HEAD
	if(!length(cyber_control.active_servers))
		return WAITING_FOR_SOMETHING

	var/datum/weakref/server_ref = pick(cyber_control.active_servers)
	var/obj/machinery/quantum_server/unlucky_server = server_ref?.resolve()
	if(isnull(unlucky_server))
		return WAITING_FOR_SOMETHING

	cyber_control.active_servers.Cut()
	if(!unlucky_server.validate_mutation_candidates())
		return WAITING_FOR_SOMETHING

	spawned_mobs = unlucky_server.setup_glitch(forced_role)

	return SUCCESSFUL_SPAWN
=======

	var/obj/machinery/quantum_server/unlucky_server = pick(cyber_control.active_servers)
	cyber_control.active_servers.Cut()

	var/list/mutation_candidates = unlucky_server.get_valid_domain_targets()
	if(!length(mutation_candidates))
		return MAP_ERROR

	var/chosen = pick(mutation_candidates)
	if(isnull(chosen) || !length(mutation_candidates))
		return MAP_ERROR

	var/datum/weakref/target_ref = pick(mutation_candidates)
	var/mob/living/mutation_target = target_ref.resolve()

	if(isnull(mutation_target)) // just in case since it takes a minute
		target_ref = pick(mutation_candidates)
		mutation_target = target_ref.resolve()
		if(isnull(mutation_target))
			return MAP_ERROR

	var/chosen_role = forced_role || pick(cyber_control.possible_antags)

	var/datum/mind/ghost_mind = get_ghost_mind(chosen_role)
	if(isnull(ghost_mind))
		return NOT_ENOUGH_PLAYERS

	var/mob/living/antag_mob
	switch(chosen_role)
		if(ROLE_CYBER_POLICE)
			antag_mob = spawn_cybercop(mutation_target, ghost_mind)

	playsound(antag_mob, 'sound/magic/ethereal_exit.ogg', 50, TRUE, -1)
	message_admins("[ADMIN_LOOKUPFLW(antag_mob)] has been made into virtual antagonist by an event.")
	antag_mob.log_message("was spawned as a virtual antagonist by an event.", LOG_GAME)

	SEND_SIGNAL(unlucky_server, COMSIG_BITRUNNER_SPAWN_GLITCH, antag_mob)

	spawned_mobs += antag_mob

	return SUCCESSFUL_SPAWN

/// Polls for a ghost that wants to run it
/datum/round_event/ghost_role/bitrunning_glitch/proc/get_ghost_mind(role_name)
	var/list/mob/dead/observer/ghosties = SSpolling.poll_ghost_candidates(
		question = "A short term antagonist role is available.",
		check_jobban = ROLE_PAI,
		poll_time = 7.5 SECONDS,
		ignore_category = POLL_IGNORE_SPLITPERSONALITY,
		pic_source = /datum/antagonist/cyber_police,
		role_name_text = role_name
	)

	if(!length(ghosties))
		return

	shuffle_inplace(ghosties)

	var/mob/dead/selected = pick(ghosties)

	var/datum/mind/player_mind = new /datum/mind(selected.key)
	player_mind.active = TRUE

	return player_mind

/// Spawns a cybercop on the mutation target
/datum/round_event/ghost_role/bitrunning_glitch/proc/spawn_cybercop(mob/living/mutation_target, datum/mind/player_mind)
	var/mob/living/carbon/human/new_agent = new(mutation_target.loc)
	mutation_target.gib()
	mutation_target = null

	player_mind.transfer_to(new_agent)
	player_mind.set_assigned_role(SSjob.GetJobType(/datum/job/cyber_police))
	player_mind.special_role = ROLE_CYBER_POLICE
	player_mind.add_antag_datum(/datum/antagonist/cyber_police)

	return new_agent

>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
