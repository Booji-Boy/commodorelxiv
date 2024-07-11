<<<<<<< HEAD
/// Lobstrosity crusher trophy. Rebukes targets, increasing their click cooldown.
=======
/// Lobstrosity crusher trophy. Staggers targets, increasing their click cooldown.
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
/obj/item/crusher_trophy/lobster_claw
	name = "lobster claw"
	icon_state = "lobster_claw"
	desc = "A lobster claw."
	denied_type = /obj/item/crusher_trophy/lobster_claw
	bonus_value = 1

/obj/item/crusher_trophy/lobster_claw/effect_desc()
<<<<<<< HEAD
	return "mark detonation to briefly rebuke the target for [bonus_value] seconds"

/obj/item/crusher_trophy/lobster_claw/on_mark_detonation(mob/living/target, mob/living/user)
	target.apply_status_effect(/datum/status_effect/rebuked, bonus_value SECONDS)
=======
	return "mark detonation to briefly stagger the target for [bonus_value] seconds"

/obj/item/crusher_trophy/lobster_claw/on_mark_detonation(mob/living/target, mob/living/user)
	target.apply_status_effect(/datum/status_effect/stagger, bonus_value SECONDS)
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
