//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:31

var/hsboxspawn = 1
var/list
		hrefs = list(
					"hsbsuit" = "Suit Up (Space Travel Gear)",
					"hsbmetal" = "Spawn 50 Metal",
					"hsbglass" = "Spawn 50 Glass",
					"hsbplasma" = "Spawn 50 Plasma",
					"hsbabductor" = "Spawn 50 Abductor Alloy",
					"hsbregulator" = "Spawn Air Pump",
					"hsbfilter" = "Spawn Air Scrubber",
					"hsbcanister" = "Spawn Canister",
					"hsbfueltank" = "Spawn Welding Fuel Tank",
					"hsbwater	tank" = "Spawn Water Tank",
					"hsbtoolbox" = "Spawn Toolbox",
					"hsbmedkit" = "Spawn Medical Kit",
					"revive" = "Rejuvenate")

/mob/var/datum/hSB/sandbox = null
/mob/proc/CanBuild()
	if(GLOB.dynamic_sandbox)
		sandbox = new/datum/hSB
		sandbox.owner = src
		sandbox.admin = 0
		if(check_rights(R_ADMIN))
			sandbox.admin = 1
		verbs += new /mob/proc/sandbox_panel
		verbs += new /mob/proc/sandbox_spawn_atom
		to_chat(src, "<B>Build your own station with the sandbox-panel command!</B>", confidential = FALSE)

/mob/proc/sandbox_panel()
	set name = "Sandbox Panel"
	set category = "Sandbox"

	//if(sandbox)
	if(GLOB.dynamic_sandbox)
		sandbox.update()

var/global/list/banned_sandbox_types=list(
	// /obj/item/weapon/gun,
	// /obj/item/assembly,
	// /obj/item/device/camera,
	// /obj/item/weapon/cloaking_device,
	// /obj/item/weapon/dummy,
	// /obj/item/weapon/melee/energy/sword,
	/obj/item/veilrender,
	// /obj/item/weapon/reagent_containers/glass/bottle/wizarditis,
	// /obj/item/weapon/spellbook,
	/obj/narsie,
	/obj/singularity
	// /obj/item/weapon/gun/energy/staff
	)

proc/is_banned_type(typepath)
	for(var/btype in banned_sandbox_types)
		if(findtext("[typepath]", "[btype]")!=0)
			return 1
	return 0

/mob/proc/sandbox_spawn_atom(var/object as text)
	set category = "Sandbox"
	set desc = "Spawn any item or machine"
	set name = "Sandbox Spawn"
	if(hsboxspawn == 0)
		to_chat(usr, "<span class='warning'>Sandbox spawning disabled!</span>")
		return
	var/list/types = typesof(/obj/item) + typesof(/obj/machinery)
	for(var/type in types)
		if(is_banned_type(type))
			types -= type
	var/list/matches = new()

	for(var/path in types)
		if(is_banned_type(path))
			continue
		if(findtext("[path]", object)!=0)
			matches += path

	if(matches.len==0)
		return

	var/chosen
	if(matches.len==1)
		chosen = matches[1]
	else
		chosen = input("Select an atom type", "Spawn Atom", matches[1]) as null|anything in matches
		if(!chosen)
			return
	if(is_banned_type(chosen))
		to_chat(usr, "<b>Denied.</b>", confidential = TRUE)
		return
	new chosen(usr.loc)

	message_admins("\[SANDBOX\] [key_name(usr)] spawned [chosen] at ([usr.x],[usr.y],[usr.z])")
	//send2adminirc("\[SANDBOX\] [key_name(usr)] spawned [chosen] at ([usr.x],[usr.y],[usr.z])")
	//feedback_add_details("admin_verb","hSBSA") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

datum/hSB
	var/owner = null
	var/admin = 0
	proc
		update()
			//owner = src
			if(check_rights(R_ADMIN)) //it usually fails to set admin correctly in the beginning so just set it everytime
				admin = 1
			else
				admin = 0
			var/hsbpanel = "<center><b>h_Sandbox Panel</b></center><hr>"
			hsbpanel += "<b>Admin State:[admin]</b><br>"
			if(check_rights(R_ADMIN))

				// AUTOFIXED BY fix_string_idiocy.py
				// C:\Users\Rob\Documents\Projects\vgstation13\code\game\gamemodes\sandbox\h_sandbox.dm:39: hsbpanel += "<b>Administration Tools:</b><br>"
				hsbpanel += {"<b>Administration Tools:</b><br>
					- <a href=\"?\ref[src];hsb=hsbtobj\">Toggle Object Spawning</a><br><br>"}
			// END AUTOFIX

			hsbpanel += "<b>Regular Tools:</b><br>"
			for(var/T in hrefs)
				hsbpanel += "- <a href=\"?\ref[src];hsb=[T]\">[hrefs[T]]</a><br>"
			if(hsboxspawn)
				hsbpanel += "- <a href=\"?\ref[src];hsb=hsbobj\">Spawn Object</a><br><br>"
			usr << browse(hsbpanel, "window=hsbpanel")
	Topic(href, href_list)
		if(!(src.owner == usr)) //checks that the mob hasn't changed since panel was opened. this keeps people from opening the panel and then ghosting or other dumb things like that
			to_chat(usr, "<b>Please close and reopen the sandbox panel.</b>", confidential = TRUE)
			return
		if(!usr) return //I guess this is possible if they log out or die with the panel open? It happened.
		if(href_list["hsb"])
			switch(href_list["hsb"])
				if("revive")
					if(istype(usr,/mob/living))
						var/mob/living/M = usr
						M.revive(ADMIN_HEAL_ALL, force_grab_ghost = TRUE)
				if("hsbtobj")
					if(!check_rights(R_ADMIN))
						to_chat(usr, "<span class='warning'>You do not have admin rights!</span>")
						return
					if(hsboxspawn)
						to_chat(world, "<b>Sandbox:  [usr.key] has disabled object spawning!</b>", confidential = FALSE)
						hsboxspawn = 0
						return
					if(!hsboxspawn)
						to_chat(world, "<b>Sandbox:  [usr.key] has enabled object spawning!</b>", confidential = FALSE)
						hsboxspawn = 1
						return
				if("hsbsuit")
					if(!istype(usr,/mob/living/carbon/human))
						to_chat(usr, "<span class='warning'>Only humanoid species can do this!</span>")
						return
					var/mob/living/carbon/human/P = usr
					P.equipOutfit(/datum/outfit/space)
				if("hsbmetal")
					var/obj/item/stack/sheet/hsb = new/obj/item/stack/sheet/iron
					hsb.amount = 50
					hsb.loc = usr.loc
					hsb.loc = usr.loc
				if("hsbglass")
					var/obj/item/stack/sheet/hsb = new/obj/item/stack/sheet/glass
					hsb.amount = 50
					hsb.loc = usr.loc
				if("hsbregulator")
					var/obj/machinery/portable_atmospherics/pump/hsb = new/obj/machinery/portable_atmospherics/pump
					hsb.loc = usr.loc
				if("hsbfilter")
					var/obj/machinery/portable_atmospherics/scrubber/hsb = new/obj/machinery/portable_atmospherics/scrubber
					hsb.loc = usr.loc
				if("hsbplasma")
					var/obj/item/stack/sheet/mineral/plasma/hsb = new/obj/item/stack/sheet/mineral/plasma
					hsb.amount = 50
					hsb.loc = usr.loc
				if("hsbabductor")
					var/obj/item/stack/sheet/hsb = new/obj/item/stack/sheet/mineral/abductor
					hsb.amount = 50
					hsb.loc = usr.loc
				if("hsbcanister")
					var/list/hsbcanisters = typesof(/obj/machinery/portable_atmospherics/canister/) - /obj/machinery/portable_atmospherics/canister/
//					hsbcanisters -= /obj/machinery/portable_atmospherics/canister/sleeping
					var/hsbcanister = input(usr, "Choose a canister to spawn.", "Sandbox:") in hsbcanisters + "Cancel"
					if(!(hsbcanister == "Cancel"))
						new hsbcanister(usr.loc)
				if("hsbfueltank")
					new /obj/structure/reagent_dispensers/fueltank(usr.loc)
				if("hsbwatertank")
					new /obj/structure/reagent_dispensers/watertank(usr.loc)
				if("hsbtoolbox")
					var/obj/item/storage/toolbox/mechanical/hsb = new/obj/item/storage/toolbox/mechanical
					hsb.loc = usr.loc
				if("hsbmedkit")
					var/obj/item/storage/medkit/advanced/hsb = new/obj/item/storage/medkit/advanced
					hsb.loc = usr.loc
				if("hsbobj") //for the freaks who use the sandbox panel instead of the command
					if(hsboxspawn == 0)
						to_chat(usr, "<span class='warning'>Sandbox spawning disabled!</span>")
						return

					var/object = input(usr, "Select an atom type", "Spawn Atom", null) as text //ask user for search string

					var/list/types = typesof(/obj/item) + typesof(/obj/machinery)
					for(var/type in types)
						if(is_banned_type(type))
							types -= type
					var/list/matches = new()

					for(var/path in types)
						if(is_banned_type(path))
							continue
						if(findtext("[path]", object)!=0)
							matches += path

					if(matches.len==0)
						return

					var/chosen
					if(matches.len==1)
						chosen = matches[1]
					if(matches.len<1)
						return
					if(matches.len>1)
						chosen = input(usr, "Select an atom type", "Spawn Atom", matches[1]) as null|anything in matches
					if(is_banned_type(chosen))
						src << "\red Denied."
						return
					if(!chosen)
						return
					new chosen(usr.loc)

					message_admins("\[SANDBOX\] [key_name(usr)] spawned [chosen] at ([usr.x],[usr.y],[usr.z])")