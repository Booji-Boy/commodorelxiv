/datum/storage/fish_case
	max_slots = 1
	max_specific_storage = WEIGHT_CLASS_HUGE
<<<<<<< HEAD
	can_hold_description = "Fish and aquarium equipment"

/datum/storage/fish_case/can_insert(obj/item/to_insert, mob/user, messages, force)
	. = ..()
	if(!.)
		return .
	if(!HAS_TRAIT(to_insert, TRAIT_FISH_CASE_COMPATIBILE))
		if(messages && user)
			user.balloon_alert(user, "can't hold!")
		return FALSE
	return .

/*
 * Change the size of the storage item to match the inserted item's
 * Because of that, we also check if conditions to keep it inside another storage or pockets are still met.
 */
/datum/storage/fish_case/handle_enter(datum/source, obj/item/arrived)
	. = ..()
	if(!isitem(parent) || !istype(arrived))
		return
	var/obj/item/item_parent = parent
	if(arrived.w_class <= item_parent.w_class)
		return
	item_parent.update_weight_class(arrived.w_class)

/datum/storage/fish_case/handle_exit(datum/source, obj/item/gone)
	. = ..()
	if(!isitem(parent) || !istype(gone))
		return
	var/obj/item/item_parent = parent
	item_parent.update_weight_class(initial(item_parent.w_class))
=======
	can_hold_trait = TRAIT_FISH_CASE_COMPATIBILE
	can_hold_description = "fish and aquarium equipment"

/**
 * Change the size of the storage item to match the inserted item's
 * Because of that, we also check if conditions to keep it inside another storage or pockets are still met.
 */
/datum/storage/fish_case/handle_enter(obj/item/storage/fish_case/source, obj/item/arrived)
	. = ..()
	if(!istype(arrived) || arrived.w_class == source.w_class)
		return
	source.w_class = arrived.w_class
	var/obj/item/resolve_parent = parent?.resolve()
	if(resolve_parent?.item_flags & IN_STORAGE)
		source.moveToNullspace() //temporarily remove source from its location so that attempt_insert may work correctly.
		if(!resolve_parent.atom_storage?.attempt_insert(source, override = TRUE))
			source.forceMove(resolve_parent.drop_location())
			source.visible_message("[source] spills out of [resolve_parent] as it expands to hold [arrived]", vision_distance = 1)
	else if(!isliving(source.loc))
		return
	var/mob/living/living_loc = source.loc
	var/equipped_slot = living_loc.get_slot_by_item(source)
	if(equipped_slot & (ITEM_SLOT_RPOCKET|ITEM_SLOT_LPOCKET) && source.w_class > WEIGHT_CLASS_SMALL)
		source.forceMove(living_loc.drop_location())
		to_chat(living_loc, "[source] drops out of your pockets as it expands to hold [arrived]")

/datum/storage/fish_case/handle_exit(obj/item/storage/fish_case/source, obj/item/gone)
	. = ..()
	if(istype(gone))
		source.w_class = initial(source.w_class)
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
