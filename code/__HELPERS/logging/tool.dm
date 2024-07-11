/// Logging for tool usage
<<<<<<< HEAD
/proc/log_tool(text)
	logger.Log(LOG_CATEGORY_TOOL, text)
=======
/proc/log_tool(text, mob/initiator)
	logger.Log(LOG_CATEGORY_TOOL, text, initiator ? list("initiator" = initiator) : null)
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
