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

	if(istype(target, /mob/living/carbon/human))
		var/mob/living/carbon/human/victim = target
		var/undiecheck = victim.underwear + victim.undershirt + victim.socks

		//don't do anything if dead
		if(!(isliving(victim)))
			return

		//if wearing tranny socks (or underwear/undershirt, in case those are added), kill. otherwise continue
		if(findtext(undiecheck, "Trans"))
			call(victim, "david_reimer")()
			return

		//if wearing a uniform, check for pride pin. kill if present, otherwise continue
		if(!(victim.w_uniform == null))
			for(var/obj/item/clothing/accessory/pride/m in victim.w_uniform.contents)
				call(victim, "david_reimer")()
				return

		//check if gender matches physique. if it does, do nothing
		if(victim.gender == victim.physique)
			to_chat(victim, span_notice("You feel normal."))
			return

		//kill in any other instances of gender incongruence
		call(victim, "david_reimer")()



/obj/item/gun/energy/trannihilator
	name ="trannihilator"
	desc = "The preferred weapon of TERFs."
	icon_state = "shrink_ray"
	inhand_icon_state = "gun"
	w_class = WEIGHT_CLASS_BULKY
	icon = 'icons/obj/weapons/guns/energy.dmi'
	ammo_type = list(/obj/item/ammo_casing/energy/trannihilator)


/obj/item/slimepotion/genderchange/pride
	name = "transgender potion"
	desc = "A potion full of pride."
	icon = 'icons/obj/commodore.dmi'
	icon_state = "pottrans"

/obj/item/slimepotion/genderchange/pride/attack(mob/living/carbon/human/L, mob/user)
	if(!istype(L) || L.stat == DEAD)
		to_chat(user, span_warning("The potion can only be used on living humanoids!"))
		return

	if(L.gender != MALE && L.gender != FEMALE)
		to_chat(user, span_warning("The potion can only be used by gendered things, but you are still valid!"))
		return

	if(L.physique == MALE)
		L.physique = FEMALE
		L.visible_message(span_boldnotice("[L] suddenly looks more feminine!"), span_boldwarning("You suddenly feel more feminine!"))
	else
		L.physique = MALE
		L.visible_message(span_boldnotice("[L] suddenly looks more masculine!"), span_boldwarning("You suddenly feel more masculine!"))
	ADD_TRAIT(src, TRAIT_DISFIGURED, TRAIT_GENERIC)
	L.regenerate_icons()
	qdel(src)
	if(rand(0,100) <= 41)
		addtimer(CALLBACK(L, /mob/living/carbon/proc/david_reimer), rand(60, 300))

/mob/living/carbon/proc/david_reimer()
	//call(user, "set_suicide")("1")
	src.set_suicide("1")
	src.visible_message("<span class='suicide'>[src] is suddenly coming to terms with a life full of regret! It looks like [src.p_theyre()] trying to commit suicide!</span>")
	src.inflate_gib()