/obj/item/pussymonkey
	name = "inquiring pussycat"
	desc = "You have the overwhelming urge to know what's new with this pussycat."
	icon = 'icons/obj/commodore.dmi'
	icon_state = "pussycat"
	inhand_icon_state = "nothing"
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'

/obj/item/pussymonkey/attack_self(mob/user)
	. = ..()
	var/list/nearby_monkeys = list()

	//scan for monkeys within 16 tiles of usuer
	for(var/mob/living/carbon/human/species/monkey/seenmonkey in oview(16, user))
		//make sure: not player controlled, has ai controller, is not already aggressive
		if(seenmonkey.ckey == null && seenmonkey.ai_controller && !(seenmonkey.ai_controller.blackboard[BB_MONKEY_AGGRESSIVE]))
			nearby_monkeys += seenmonkey

	//for all non-angry ai monkeys: make angry, set attack target to user
	for(var/mob/m in nearby_monkeys)
		m.ai_controller.blackboard[BB_MONKEY_AGGRESSIVE] = TRUE
		m.ai_controller.blackboard[BB_MONKEY_CURRENT_ATTACK_TARGET] = user
		m.ai_controller.add_blackboard_key_assoc(BB_MONKEY_ENEMIES, user)
		break

	//play sound effect
	playsound(user.loc, 'sound/misc/pussycat.ogg', 50, 1)
	user.visible_message(span_notice("[user] wants to know the latest happenings from the pussycat!"))
