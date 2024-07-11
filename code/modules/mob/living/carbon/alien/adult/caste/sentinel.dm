/mob/living/carbon/alien/adult/sentinel
	name = "alien sentinel"
	caste = "s"
	maxHealth = 150
	health = 150
	icon_state = "aliens"
	alien_speed = 0.2

/mob/living/carbon/alien/adult/sentinel/Initialize(mapload)
<<<<<<< HEAD
	GRANT_ACTION(/datum/action/cooldown/mob_cooldown/sneak/alien)
=======
	var/datum/action/cooldown/sneak/alien/sneaky_beaky = new(src)
	sneaky_beaky.Grant(src)
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	return ..()

/mob/living/carbon/alien/adult/sentinel/create_internal_organs()
	organs += new /obj/item/organ/internal/alien/plasmavessel
	organs += new /obj/item/organ/internal/alien/acid
	organs += new /obj/item/organ/internal/alien/neurotoxin
	..()
