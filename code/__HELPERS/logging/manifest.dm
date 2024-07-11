/// Logging for player manifest (ckey, name, job, special role, roundstart/latejoin)
/proc/log_manifest(ckey, datum/mind/mind, mob/body, latejoin = FALSE)
<<<<<<< HEAD
	var/message = "[ckey] \\ [body.real_name] \\ [mind.assigned_role.title] \\ [mind.special_role || "NONE"] \\ [latejoin ? "LATEJOIN" : "ROUNDSTART"]"
=======
	var/message = {"([body.real_name])\[[ckey]\] added to manifest
					as a(n) [latejoin ? "LATEJOIN " : ""][mind.assigned_role.title][mind.special_role ? mind.special_role : ""]
					with a location of [loc_name(body.loc)]"}
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	logger.Log(LOG_CATEGORY_MANIFEST, message, list(
		"mind" = mind, "body" = body, "latejoin" = latejoin
	))
