/obj/item/organ/internal/butt
	name = "butt"
	icon_state = "butt"
	visual = FALSE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_BUTT
	gender = PLURAL
	desc = "So many butts, so little time."
	healing_factor = STANDARD_ORGAN_HEALING
	decay_factor = STANDARD_ORGAN_DECAY
	food_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/drug/vitaminf = 5)
	grind_results = list(/datum/reagent/drug/vitaminf = 5)
	var/list/spans = null