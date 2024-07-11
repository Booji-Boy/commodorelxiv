<<<<<<< HEAD

ADMIN_VERB(requests, R_NONE, "Requests Manager", "Open the request manager panel to view all requests during this round", ADMIN_CATEGORY_GAME)
=======
/// Verb for opening the requests manager panel
/client/proc/requests()
	set name = "Requests Manager"
	set desc = "Open the request manager panel to view all requests during this round"
	set category = "Admin.Logging"
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Request Manager") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	GLOB.requests.ui_interact(usr)
	BLACKBOX_LOG_ADMIN_VERB("Request Manager")
