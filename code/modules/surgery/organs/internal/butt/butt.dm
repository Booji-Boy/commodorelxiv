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
	throwforce = 8

//clothing specific code

	var/list/spans = null
	resistance_flags = FLAMMABLE
	max_integrity = 200
	integrity_failure = 0.4
	var/damaged_clothes = CLOTHING_PRISTINE //similar to machine's BROKEN stat and structure's broken var
	worn_icon = 'icons/mob/clothing/head/butt.dmi'
	//lefthand_file = 'icons/mob/inhands/clothing/hats_lefthand.dmi'
	//righthand_file = 'icons/mob/inhands/clothing/hats_righthand.dmi'
	body_parts_covered = HEAD
	slot_flags = ITEM_SLOT_HEAD

	///What level of bright light protection item has.
	var/flash_protect = FLASH_PROTECTION_NONE
	var/tint = 0 //Sets the item's level of visual impairment tint, normally set to the same as flash_protect
	var/up = 0 //but separated to allow items to protect but not impair vision, like space helmets
	var/visor_flags = 0 //flags that are added/removed when an item is adjusted up/down
	var/visor_flags_inv = 0 //same as visor_flags, but for flags_inv
	var/visor_flags_cover = 0 //same as above, but for flags_cover
	///What to toggle when toggled with weldingvisortoggle()
	var/visor_vars_to_toggle = VISOR_FLASHPROTECT | VISOR_TINT | VISOR_VISIONFLAGS | VISOR_INVISVIEW

	var/clothing_flags = NONE
	///List of items that can be equipped in the suit storage slot while we're worn.
	var/list/allowed

	var/can_be_bloody = TRUE

	///Prevents the article of clothing from gaining the mood boost from washing. Used for the tacticool turtleneck.
	var/stubborn_stains = FALSE

	/// What items can be consumed to repair this clothing (must by an /obj/item/stack)
	var/repairable_by = /obj/item/stack/sheet/cloth

	//Var modification - PLEASE be careful with this I know who you are and where you live
	var/list/user_vars_to_edit //VARNAME = VARVALUE eg: "name" = "butts"
	var/list/user_vars_remembered //Auto built by the above + dropped() + equipped()

	/// Trait modification, lazylist of traits to add/take away, on equipment/drop in the correct slot
	var/list/clothing_traits

	/// How much clothing damage has been dealt to each of the limbs of the clothing, assuming it covers more than one limb
	var/list/damage_by_parts
	/// How much integrity is in a specific limb before that limb is disabled (for use in [/obj/item/organ/internal/butt/proc/take_damage_zone], and only if we cover multiple zones.) Set to 0 to disable shredding.
	var/limb_integrity = 0
	/// How many zones (body parts, not precise) we have disabled so far, for naming purposes
	var/zones_disabled

	/// A lazily initiated "food" version of the clothing for moths.
	// This intentionally does not use the edible component, for a few reasons.
	// 1. Effectively everything that wants something edible, from now and into the future,
	// does not want to receive clothing, simply because moths *can* eat it.
	// 2. Creating this component for all clothing has a non-negligible impact on init times and memory.
	// 3. Creating the component contextually to solve #2 will make #1 much more confusing,
	// and frankly not be a better solution than what we are doing now.
	// The first issue could be solved if "edible" checks were more granular,
	// such that you never actually cared about checking if something is *edible*.
	var/obj/item/food/clothing/moth_snack

/obj/item/organ/internal/butt/Initialize(mapload)
	if(clothing_flags & VOICEBOX_TOGGLABLE)
		actions_types += /datum/action/item_action/toggle_voice_box
	. = ..()
	AddElement(/datum/element/venue_price, FOOD_PRICE_CHEAP)
	if(can_be_bloody && ((body_parts_covered & FEET) || (flags_inv & HIDESHOES)))
		LoadComponent(/datum/component/bloodysoles)
	AddElement(/datum/element/attack_equip)
	if(!icon_state)
		item_flags |= ABSTRACT

/obj/item/organ/internal/butt/MouseDrop(atom/over_object)
	. = ..()
	var/mob/M = usr

	if(ismecha(M.loc)) // stops inventory actions in a mech
		return

	if(!M.incapacitated() && loc == M && istype(over_object, /atom/movable/screen/inventory/hand))
		var/atom/movable/screen/inventory/hand/H = over_object
		if(M.putItemFromInventoryInHandIfPossible(src, H.held_index))
			add_fingerprint(usr)

/obj/item/organ/internal/butt/proc/disable_zone(def_zone, damage_type)
	var/list/covered_limbs = cover_flags2body_zones(body_parts_covered)
	if(!(def_zone in covered_limbs))
		return

	var/zone_name = parse_zone(def_zone)
	var/break_verb = ((damage_type == BRUTE) ? "torn" : "burned")

	if(iscarbon(loc))
		var/mob/living/carbon/C = loc
		C.visible_message(span_danger("The [zone_name] on [C]'s [src.name] is [break_verb] away!"), span_userdanger("The [zone_name] on your [src.name] is [break_verb] away!"), vision_distance = COMBAT_MESSAGE_RANGE)


	zones_disabled++
	body_parts_covered &= ~body_zone2cover_flags(def_zone)

	if(body_parts_covered == NONE) // if there are no more parts to break then the whole thing is kaput
		atom_destruction((damage_type == BRUTE ? MELEE : LASER)) // melee/laser is good enough since this only procs from direct attacks anyway and not from fire/bombs
		return

	switch(zones_disabled)
		if(1)
			name = "damaged [initial(name)]"
		if(2)
			name = "mangy [initial(name)]"
		if(3 to INFINITY) // take better care of your shit, dude
			name = "tattered [initial(name)]"

	update_clothes_damaged_state(CLOTHING_DAMAGED)
	update_appearance()

/obj/item/organ/internal/butt/Destroy()
	user_vars_remembered = null //Oh god somebody put REFERENCES in here? not to worry, we'll clean it up
	QDEL_NULL(moth_snack)
	return ..()

/obj/item/organ/internal/butt/dropped(mob/living/user)
	..()
	if(!istype(user))
		return
	UnregisterSignal(user, COMSIG_MOVABLE_MOVED)
	for(var/trait in clothing_traits)
		REMOVE_CLOTHING_TRAIT(user, trait)

	if(LAZYLEN(user_vars_remembered))
		for(var/variable in user_vars_remembered)
			if(variable in user.vars)
				if(user.vars[variable] == user_vars_to_edit[variable]) //Is it still what we set it to? (if not we best not change it)
					user.vars[variable] = user_vars_remembered[variable]
		user_vars_remembered = initial(user_vars_remembered) // Effectively this sets it to null.

/obj/item/organ/internal/butt/equipped(mob/living/user, slot)
	. = ..()
	if (!istype(user))
		return
	if(slot_flags & slot) //Was equipped to a valid slot for this item?
		for(var/trait in clothing_traits)
			ADD_CLOTHING_TRAIT(user, trait)
		if (LAZYLEN(user_vars_to_edit))
			for(var/variable in user_vars_to_edit)
				if(variable in user.vars)
					LAZYSET(user_vars_remembered, variable, user.vars[variable])
					user.vv_edit_var(variable, user_vars_to_edit[variable])

// If the item is a piece of clothing and is being worn, make sure it updates on the player
/obj/item/organ/internal/butt/update_greyscale()
	. = ..()

	var/mob/living/carbon/human/wearer = loc

	if(!istype(wearer))
		return

	wearer.update_clothing(slot_flags)

/**
 * Inserts a trait (or multiple traits) into the clothing traits list
 *
 * If worn, then we will also give the wearer the trait as if equipped
 *
 * This is so you can add clothing traits without worrying about needing to equip or unequip them to gain effects
 */
/obj/item/organ/internal/butt/proc/attach_clothing_traits(trait_or_traits)
	if(!islist(trait_or_traits))
		trait_or_traits = list(trait_or_traits)

	LAZYOR(clothing_traits, trait_or_traits)
	var/mob/wearer = loc
	if(istype(wearer) && (wearer.get_slot_by_item(src) & slot_flags))
		for(var/new_trait in trait_or_traits)
			ADD_CLOTHING_TRAIT(wearer, new_trait)

/**
 * Removes a trait (or multiple traits) from the clothing traits list
 *
 * If worn, then we will also remove the trait from the wearer as if unequipped
 *
 * This is so you can add clothing traits without worrying about needing to equip or unequip them to gain effects
 */
/obj/item/organ/internal/butt/proc/detach_clothing_traits(trait_or_traits)
	if(!islist(trait_or_traits))
		trait_or_traits = list(trait_or_traits)

	LAZYREMOVE(clothing_traits, trait_or_traits)
	var/mob/wearer = loc
	if(istype(wearer))
		for(var/new_trait in trait_or_traits)
			REMOVE_CLOTHING_TRAIT(wearer, new_trait)

/obj/item/organ/internal/butt/examine(mob/user)
	. = ..()
	if(damaged_clothes == CLOTHING_SHREDDED)
		. += span_warning("<b>[p_Theyre()] completely shredded and require[p_s()] mending before [p_they()] can be worn again!</b>")
		return

	switch (max_heat_protection_temperature)
		if (400 to 1000)
			. += "[src] offers the wearer limited protection from fire."
		if (1001 to 1600)
			. += "[src] offers the wearer some protection from fire."
		if (1601 to 35000)
			. += "[src] offers the wearer robust protection from fire."

	for(var/zone in damage_by_parts)
		var/pct_damage_part = damage_by_parts[zone] / limb_integrity * 100
		var/zone_name = parse_zone(zone)
		switch(pct_damage_part)
			if(100 to INFINITY)
				. += span_warning("<b>The [zone_name] is useless and requires mending!</b>")
			if(60 to 99)
				. += span_warning("The [zone_name] is heavily shredded!")
			if(30 to 59)
				. += span_danger("The [zone_name] is partially shredded.")

	if(atom_storage)
		var/list/how_cool_are_your_threads = list("<span class='notice'>")
		if(atom_storage.attack_hand_interact)
			how_cool_are_your_threads += "[src]'s storage opens when clicked.\n"
		else
			how_cool_are_your_threads += "[src]'s storage opens when dragged to yourself.\n"
		if (atom_storage.can_hold?.len) // If pocket type can hold anything, vs only specific items
			how_cool_are_your_threads += "[src] can store [atom_storage.max_slots] <a href='?src=[REF(src)];show_valid_pocket_items=1'>item\s</a>.\n"
		else
			how_cool_are_your_threads += "[src] can store [atom_storage.max_slots] item\s that are [weight_class_to_text(atom_storage.max_specific_storage)] or smaller.\n"
		if(atom_storage.quickdraw)
			how_cool_are_your_threads += "You can quickly remove an item from [src] using Right-Click.\n"
		if(atom_storage.silent)
			how_cool_are_your_threads += "Adding or removing items from [src] makes no noise.\n"
		how_cool_are_your_threads += "</span>"
		. += how_cool_are_your_threads.Join()

	if(get_armor().has_any_armor() || (flags_cover & (HEADCOVERSMOUTH|PEPPERPROOF)))
		. += span_notice("It has a <a href='?src=[REF(src)];list_armor=1'>tag</a> listing its protection classes.")

/obj/item/organ/internal/butt/Topic(href, href_list)
	. = ..()

	if(href_list["list_armor"])
		var/list/readout = list("<span class='notice'><u><b>PROTECTION CLASSES</u></b>")

		var/datum/armor/armor = get_armor()
		var/added_damage_header = FALSE
		for(var/damage_key in ARMOR_LIST_DAMAGE())
			var/rating = armor.get_rating(damage_key)
			if(!rating)
				continue
			if(!added_damage_header)
				readout += "\n<b>ARMOR (I-X)</b>"
				added_damage_header = TRUE
			readout += "\n[armor_to_protection_name(damage_key)] [armor_to_protection_class(rating)]"

		var/added_durability_header = FALSE
		for(var/durability_key in ARMOR_LIST_DURABILITY())
			var/rating = armor.get_rating(durability_key)
			if(!rating)
				continue
			if(!added_durability_header)
				readout += "\n<b>DURABILITY (I-X)</b>"
				added_damage_header = TRUE
			readout += "\n[armor_to_protection_name(durability_key)] [armor_to_protection_class(rating)]"

		if(flags_cover & HEADCOVERSMOUTH || flags_cover & PEPPERPROOF)
			var/list/things_blocked = list()
			if(flags_cover & HEADCOVERSMOUTH)
				things_blocked += span_tooltip("Because this item is worn on the head and is covering the mouth, it will block facehugger proboscides, killing facehuggers.", "facehuggers")
			if(flags_cover & PEPPERPROOF)
				things_blocked += "pepperspray"
			if(length(things_blocked))
				readout += "\n<b>COVERAGE</b>"
				readout += "\nIt will block [english_list(things_blocked)]."

		readout += "</span>"

		to_chat(usr, "[readout.Join()]")

/**
 * Rounds armor_value down to the nearest 10, divides it by 10 and then converts it to Roman numerals.
 *
 * Arguments:
 * * armor_value - Number we're converting
 */
/obj/item/organ/internal/butt/proc/armor_to_protection_class(armor_value)
	if (armor_value < 0)
		. = "-"
	. += "\Roman[round(abs(armor_value), 10) / 10]"
	return .

/obj/item/organ/internal/butt/atom_break(damage_flag)
	. = ..()
	update_clothes_damaged_state(CLOTHING_DAMAGED)

	if(isliving(loc)) //It's not important enough to warrant a message if it's not on someone
		var/mob/living/M = loc
		if(src in M.get_equipped_items())
			to_chat(M, span_warning("Your [name] start[p_s()] to fall apart!"))
		else
			to_chat(M, span_warning("[src] start[p_s()] to fall apart!"))

// you just dont get the same feeling with handwashed clothes
/obj/item/organ/internal/butt/machine_wash()
	. = ..()
	if(stubborn_stains) //Just can't make it feel right
		return

	var/fresh_mood = AddComponent( \
		/datum/component/onwear_mood, \
		saved_event_type = /datum/mood_event/fresh_laundry, \
		examine_string = "[src] looks crisp and pristine.", \
	)

	QDEL_IN(fresh_mood, 2 MINUTES)

//This mostly exists so subtypes can call appriopriate update icon calls on the wearer.
/obj/item/organ/internal/butt/proc/update_clothes_damaged_state(damaged_state = CLOTHING_DAMAGED)
	damaged_clothes = damaged_state

/obj/item/organ/internal/butt/update_overlays()
	. = ..()
	if(!damaged_clothes)
		return

	var/index = "[REF(icon)]-[icon_state]"
	var/static/list/damaged_clothes_icons = list()
	var/icon/damaged_clothes_icon = damaged_clothes_icons[index]
	if(!damaged_clothes_icon)
		damaged_clothes_icon = icon(icon, icon_state, , 1)
		damaged_clothes_icon.Blend("#fff", ICON_ADD) //fills the icon_state with white (except where it's transparent)
		damaged_clothes_icon.Blend(icon('icons/effects/item_damage.dmi', "itemdamaged"), ICON_MULTIPLY) //adds damage effect and the remaining white areas become transparant
		damaged_clothes_icon = fcopy_rsc(damaged_clothes_icon)
		damaged_clothes_icons[index] = damaged_clothes_icon
	. += damaged_clothes_icon

//hat specific code

///Special throw_impact for hats to frisbee hats at people to place them on their heads/attempt to de-hat them.
/obj/item/organ/internal/butt/throw_impact(atom/hit_atom, datum/thrownthing/thrownthing)
	. = ..()
	///if the thrown object's target zone isn't the head
	if(thrownthing.target_zone != BODY_ZONE_HEAD)
		return
	///ignore any hats with the tinfoil counter-measure enabled
	if(clothing_flags & ANTI_TINFOIL_MANEUVER)
		return
	///if the hat happens to be capable of holding contents and has something in it. mostly to prevent super cheesy stuff like stuffing a mini-bomb in a hat and throwing it
	if(LAZYLEN(contents))
		return
	if(iscarbon(hit_atom))
		var/mob/living/carbon/H = hit_atom
		if(istype(H.head, /obj/item))
			var/obj/item/WH = H.head
			///check if the item has NODROP
			if(HAS_TRAIT(WH, TRAIT_NODROP))
				H.visible_message(span_warning("[src] bounces off [H]'s [WH.name]!"), span_warning("[src] bounces off your [WH.name], falling to the floor."))
				return
			///check if the item is an actual clothing head item, since some non-clothing items can be worn
			if(istype(WH, /obj/item/organ/internal/butt))
				var/obj/item/organ/internal/butt/WHH = WH
				///SNUG_FIT hats are immune to being knocked off
				if(WHH.clothing_flags & SNUG_FIT)
					H.visible_message(span_warning("[src] bounces off [H]'s [WHH.name]!"), span_warning("[src] bounces off your [WHH.name], falling to the floor."))
					return
			///if the hat manages to knock something off
			if(H.dropItemToGround(WH))
				H.visible_message(span_warning("[src] knocks [WH] off [H]'s head!"), span_warning("[WH] is suddenly knocked off your head by [src]!"))
		if(H.equip_to_slot_if_possible(src, ITEM_SLOT_HEAD, 0, 1, 1))
			H.visible_message(span_notice("[src] lands neatly on [H]'s head!"), span_notice("[src] lands perfectly onto your head!"))
			H.update_held_items() //force update hands to prevent ghost sprites appearing when throw mode is on
		return
	if(iscyborg(hit_atom))
		var/mob/living/silicon/robot/R = hit_atom
		var/obj/item/worn_hat = R.hat
		if(worn_hat && HAS_TRAIT(worn_hat, TRAIT_NODROP))
			R.visible_message(span_warning("[src] bounces off [worn_hat], without an effect!"), span_warning("[src] bounces off your mighty [worn_hat.name], falling to the floor in defeat."))
			return
		if(is_type_in_typecache(src, GLOB.blacklisted_borg_hats))//hats in the borg's blacklist bounce off
			R.visible_message(span_warning("[src] bounces off [R]!"), span_warning("[src] bounces off you, falling to the floor."))
			return
		else
			R.visible_message(span_notice("[src] lands neatly on top of [R]!"), span_notice("[src] lands perfectly on top of you."))
			R.place_on_head(src) //hats aren't designed to snugly fit borg heads or w/e so they'll always manage to knock eachother off





/obj/item/organ/internal/butt/worn_overlays(mutable_appearance/standing, isinhands = FALSE)
	. = ..()
	if(isinhands)
		return

	if(damaged_clothes)
		. += mutable_appearance('icons/effects/item_damage.dmi', "damagedhelmet")
	if(GET_ATOM_BLOOD_DNA_LENGTH(src))
		if(clothing_flags & LARGE_WORN_ICON)
			. += mutable_appearance('icons/effects/64x64.dmi', "helmetblood_large")
		else
			. += mutable_appearance('icons/effects/blood.dmi', "helmetblood")

/obj/item/organ/internal/butt/update_clothes_damaged_state(damaged_state = CLOTHING_DAMAGED)
	..()
	if(ismob(loc))
		var/mob/M = loc
		M.update_worn_head()
