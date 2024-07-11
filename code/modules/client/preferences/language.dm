/datum/preference/choiced/language
<<<<<<< HEAD
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
=======
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	savefile_key = "language"
	savefile_identifier = PREFERENCE_CHARACTER

/datum/preference/choiced/language/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	return "Bilingual" in preferences.all_quirks

/datum/preference/choiced/language/init_possible_values()
	var/list/values = list()

<<<<<<< HEAD
	if(!GLOB.uncommon_roundstart_languages.len)
=======
	if(!GLOB.roundstart_languages.len)
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
		generate_selectable_species_and_languages()

	values += "Random"

	//we add uncommon as it's foreigner-only.
	var/datum/language/uncommon/uncommon_language = /datum/language/uncommon
	values += initial(uncommon_language.name)

<<<<<<< HEAD
	for(var/datum/language/language_type as anything in GLOB.uncommon_roundstart_languages)
=======
	for(var/datum/language/language_type as anything in GLOB.roundstart_languages)
		if(ispath(language_type, /datum/language/common))
			continue
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
		if(initial(language_type.name) in values)
			continue
		values += initial(language_type.name)

	return values

/datum/preference/choiced/language/apply_to_human(mob/living/carbon/human/target, value)
	return
