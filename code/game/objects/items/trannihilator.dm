/obj/item/ammo_casing/energy/trannihilator
	name = "trannihilator casing"
	desc = "Why are you seeing this?!"
	projectile_type = /obj/projectile/bullet/trannihilator
	icon = 'icons/obj/clothing/accessories.dmi'
	icon_state = "pride_trans"
	//pellets = 7
	//variance = 55
	select_name = "spray the gay away"
	e_cost = 0
	click_cooldown_override = 0.1

/obj/projectile/bullet/trannihilator
	name = "trannihilator blast"
	desc = "A globule of concentrated gender dysphoria."
	icon = 'icons/obj/clothing/accessories.dmi'
	icon_state = "pride_trans"
	damage = 0
	speed = 0.5
	embedding = null

/obj/projectile/bullet/trannihilator/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()

	if(isliving(target) && istype(target, /mob/living/carbon/human))
		var/mob/living/carbon/human/victim = target

		if(!(victim.gender == victim.physique))
			call(victim, "set_suicide")("1") //calling individual suicide procs to get around the prompt window
			call(victim, "send_applicable_messages")("default mode message")
			call(victim, "final_checkout")()
		else
			to_chat(victim, span_notice("You feel normal."))

/obj/item/gun/energy/trannihilator
	name ="trannihilator"
	desc = "The preferred weapon of TERFs."
	icon_state = "shrink_ray"
	inhand_icon_state = "gun"
	w_class = WEIGHT_CLASS_BULKY
	icon = 'icons/obj/weapons/guns/energy.dmi'
	ammo_type = list(/obj/item/ammo_casing/energy/trannihilator)