/datum/computer_file/program/maintenance/modsuit_control
	filename = "modsuit_control"
	filedesc = "MODsuit Control"
	program_open_overlay = "modsuit_control"
	downloader_category = PROGRAM_CATEGORY_EQUIPMENT
	extended_desc = "This program allows people to connect a MODsuit to it, allowing remote control."
	size = 2
	tgui_id = "NtosMODsuit"
	program_icon = "user-astronaut"
	circuit_comp_type = /obj/item/circuit_component/mod_program/modsuit_control

	///The suit we have control over.
	var/obj/item/mod/control/controlled_suit

/datum/computer_file/program/maintenance/modsuit_control/Destroy()
	if(controlled_suit)
		unsync_modsuit()
	return ..()

/datum/computer_file/program/maintenance/modsuit_control/application_attackby(obj/item/attacking_item, mob/living/user)
	. = ..()
	if(!istype(attacking_item, /obj/item/mod/control))
		return FALSE
<<<<<<< HEAD
	sync_modsuit(attacking_item, user)
=======
	if(controlled_suit)
		unsync_modsuit()
	controlled_suit = attacking_item
	RegisterSignal(controlled_suit, COMSIG_QDELETING, PROC_REF(unsync_modsuit))
	user.balloon_alert(user, "suit updated")
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	return TRUE

/datum/computer_file/program/maintenance/modsuit_control/proc/sync_modsuit(obj/item/mod/control/new_modsuit, mob/living/user)
	if(controlled_suit)
		unsync_modsuit()
	controlled_suit = new_modsuit
	RegisterSignal(controlled_suit, COMSIG_QDELETING, PROC_REF(unsync_modsuit))
	user?.balloon_alert(user, "suit updated")

/datum/computer_file/program/maintenance/modsuit_control/proc/unsync_modsuit(atom/source)
<<<<<<< HEAD
	SIGNAL_HANDLER
=======
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	UnregisterSignal(controlled_suit, COMSIG_QDELETING)
	controlled_suit = null

/datum/computer_file/program/maintenance/modsuit_control/ui_data(mob/user)
	var/list/data = list()
	data["has_suit"] = !!controlled_suit
	if(controlled_suit)
		data += controlled_suit.ui_data()
	return data

/datum/computer_file/program/maintenance/modsuit_control/ui_static_data(mob/user)
	return controlled_suit?.ui_static_data()

/datum/computer_file/program/maintenance/modsuit_control/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
<<<<<<< HEAD
	. = ..()
	return controlled_suit?.ui_act(action, params, ui, state)


/obj/item/circuit_component/mod_program/modsuit_control
	associated_program = /datum/computer_file/program/maintenance/modsuit_control

	///Circuit port for loading a new suit to control
	var/datum/port/input/suit_port

/obj/item/circuit_component/mod_program/modsuit_control/populate_ports()
	. = ..()
	suit_port = add_input_port("MODsuit Controlled", PORT_TYPE_ATOM)

/obj/item/circuit_component/mod_program/modsuit_control/input_received(datum/port/port)
	var/datum/computer_file/program/maintenance/modsuit_control/control = associated_program
	var/obj/item/mod/control/mod = suit_port.value
	if(isnull(mod) && control.controlled_suit)
		control.unsync_modsuit()
		return
	if(!istype(mod))
		return
	control.sync_modsuit(mod)
=======
	return controlled_suit?.ui_act(action, params, ui, state)
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
