///SNAIL
/obj/item/bodypart/head/snail
	limb_id = SPECIES_SNAIL
	is_dimorphic = FALSE
	burn_modifier = 2
	head_flags = HEAD_EYESPRITES|HEAD_DEBRAIN
	biological_state = (BIO_FLESH|BIO_BLOODED)

/obj/item/bodypart/chest/snail
	limb_id = SPECIES_SNAIL
	is_dimorphic = FALSE
	burn_modifier = 2
	biological_state = (BIO_FLESH|BIO_BLOODED)
	wing_types = NONE

/obj/item/bodypart/arm/left/snail
	limb_id = SPECIES_SNAIL
	unarmed_attack_verbs = list("slap")
	unarmed_attack_effect = ATTACK_EFFECT_DISARM
	unarmed_damage_low = 1
	unarmed_damage_high = 2 //snails are soft and squishy
	burn_modifier = 2
	biological_state = (BIO_FLESH|BIO_BLOODED)

/obj/item/bodypart/arm/right/snail
	limb_id = SPECIES_SNAIL
	unarmed_attack_verbs = list("slap")
	unarmed_attack_effect = ATTACK_EFFECT_DISARM
	unarmed_damage_low = 1
	unarmed_damage_high = 2 //snails are soft and squishy
	burn_modifier = 2
	biological_state = (BIO_FLESH|BIO_BLOODED)

/obj/item/bodypart/leg/left/snail
	limb_id = SPECIES_SNAIL
	unarmed_damage_low = 1
	unarmed_damage_high = 2 //snails are soft and squishy
	burn_modifier = 2
	biological_state = (BIO_FLESH|BIO_BLOODED)

/obj/item/bodypart/leg/right/snail
	limb_id = SPECIES_SNAIL
	unarmed_damage_low = 1
	unarmed_damage_high = 2 //snails are soft and squishy
	burn_modifier = 2
	biological_state = (BIO_FLESH|BIO_BLOODED)

///ABDUCTOR
/obj/item/bodypart/head/abductor
	limb_id = SPECIES_ABDUCTOR
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	head_flags = NONE

/obj/item/bodypart/chest/abductor
	limb_id = SPECIES_ABDUCTOR
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	wing_types = NONE

/obj/item/bodypart/chest/abductor/get_butt_sprite()
	return icon('icons/mob/butts.dmi', BUTT_SPRITE_GREY)

/obj/item/bodypart/arm/left/abductor
	limb_id = SPECIES_ABDUCTOR
	should_draw_greyscale = FALSE
	bodypart_traits = list(TRAIT_CHUNKYFINGERS)

/obj/item/bodypart/arm/right/abductor
	limb_id = SPECIES_ABDUCTOR
	should_draw_greyscale = FALSE
	bodypart_traits = list(TRAIT_CHUNKYFINGERS)

/obj/item/bodypart/leg/left/abductor
	limb_id = SPECIES_ABDUCTOR
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/right/abductor
	limb_id = SPECIES_ABDUCTOR
	should_draw_greyscale = FALSE

///JELLY
/obj/item/bodypart/head/jelly
	biological_state = (BIO_FLESH|BIO_BLOODED)
	limb_id = SPECIES_JELLYPERSON
	is_dimorphic = TRUE
	dmg_overlay_type = null
	burn_modifier = 0.5 // = 1/2x generic burn damage
	head_flags = HEAD_EYECOLOR | HEAD_EYESPRITES | HEAD_HAIR | HEAD_FACIAL_HAIR

/obj/item/bodypart/chest/jelly
	biological_state = (BIO_FLESH|BIO_BLOODED)
	limb_id = SPECIES_JELLYPERSON
	is_dimorphic = TRUE
	dmg_overlay_type = null
	burn_modifier = 0.5 // = 1/2x generic burn damage
	wing_types = list(/obj/item/organ/external/wings/functional/slime)

/obj/item/bodypart/chest/jelly/get_butt_sprite()
	return icon('icons/mob/butts.dmi', BUTT_SPRITE_SLIME)

/obj/item/bodypart/arm/left/jelly
<<<<<<< HEAD
	biological_state = (BIO_FLESH|BIO_BLOODED)
=======
	biological_state = (BIO_FLESH|BIO_BLOODED|BIO_JOINTED)
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	limb_id = SPECIES_JELLYPERSON
	dmg_overlay_type = null
	burn_modifier = 0.5 // = 1/2x generic burn damage

/obj/item/bodypart/arm/right/jelly
<<<<<<< HEAD
	biological_state = (BIO_FLESH|BIO_BLOODED)
=======
	biological_state = (BIO_FLESH|BIO_BLOODED|BIO_JOINTED)
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	limb_id = SPECIES_JELLYPERSON
	dmg_overlay_type = null
	burn_modifier = 0.5 // = 1/2x generic burn damage

/obj/item/bodypart/leg/left/jelly
<<<<<<< HEAD
	biological_state = (BIO_FLESH|BIO_BLOODED)
=======
	biological_state = (BIO_FLESH|BIO_BLOODED|BIO_JOINTED)
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	limb_id = SPECIES_JELLYPERSON
	dmg_overlay_type = null
	burn_modifier = 0.5 // = 1/2x generic burn damage

/obj/item/bodypart/leg/right/jelly
<<<<<<< HEAD
	biological_state = (BIO_FLESH|BIO_BLOODED)
=======
	biological_state = (BIO_FLESH|BIO_BLOODED|BIO_JOINTED)
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	limb_id = SPECIES_JELLYPERSON
	dmg_overlay_type = null
	burn_modifier = 0.5 // = 1/2x generic burn damage

///SLIME
<<<<<<< HEAD
/obj/item/bodypart/head/jelly/slime
	limb_id = SPECIES_SLIMEPERSON
	is_dimorphic = FALSE

/obj/item/bodypart/chest/jelly/slime
	limb_id = SPECIES_SLIMEPERSON

/obj/item/bodypart/arm/left/jelly/slime
	limb_id = SPECIES_SLIMEPERSON

/obj/item/bodypart/arm/right/jelly/slime
	limb_id = SPECIES_SLIMEPERSON

/obj/item/bodypart/leg/left/jelly/slime
	limb_id = SPECIES_SLIMEPERSON

/obj/item/bodypart/leg/right/jelly/slime
	limb_id = SPECIES_SLIMEPERSON

///LUMINESCENT
/obj/item/bodypart/head/jelly/luminescent
	limb_id = SPECIES_LUMINESCENT

/obj/item/bodypart/chest/jelly/luminescent
	limb_id = SPECIES_LUMINESCENT

/obj/item/bodypart/arm/left/jelly/luminescent
	limb_id = SPECIES_LUMINESCENT

/obj/item/bodypart/arm/right/jelly/luminescent
	limb_id = SPECIES_LUMINESCENT

/obj/item/bodypart/leg/left/jelly/luminescent
	limb_id = SPECIES_LUMINESCENT

/obj/item/bodypart/leg/right/jelly/luminescent
=======
/obj/item/bodypart/head/slime
	biological_state = (BIO_FLESH|BIO_BLOODED)
	limb_id = SPECIES_SLIMEPERSON
	is_dimorphic = FALSE

/obj/item/bodypart/chest/slime
	biological_state = (BIO_FLESH|BIO_BLOODED)
	limb_id = SPECIES_SLIMEPERSON
	is_dimorphic = TRUE

/obj/item/bodypart/arm/left/slime
	biological_state = (BIO_FLESH|BIO_BLOODED|BIO_JOINTED)
	limb_id = SPECIES_SLIMEPERSON

/obj/item/bodypart/arm/right/slime
	biological_state = (BIO_FLESH|BIO_BLOODED|BIO_JOINTED)
	limb_id = SPECIES_SLIMEPERSON

/obj/item/bodypart/leg/left/slime
	biological_state = (BIO_FLESH|BIO_BLOODED)
	limb_id = SPECIES_SLIMEPERSON

/obj/item/bodypart/leg/right/slime
	biological_state = (BIO_FLESH|BIO_BLOODED|BIO_JOINTED)
	limb_id = SPECIES_SLIMEPERSON

///LUMINESCENT
/obj/item/bodypart/head/luminescent
	biological_state = (BIO_FLESH|BIO_BLOODED)
	limb_id = SPECIES_LUMINESCENT
	is_dimorphic = TRUE

/obj/item/bodypart/chest/luminescent
	biological_state = (BIO_FLESH|BIO_BLOODED)
	limb_id = SPECIES_LUMINESCENT
	is_dimorphic = TRUE

/obj/item/bodypart/arm/left/luminescent
	biological_state = (BIO_FLESH|BIO_BLOODED|BIO_JOINTED)
	limb_id = SPECIES_LUMINESCENT

/obj/item/bodypart/arm/right/luminescent
	biological_state = (BIO_FLESH|BIO_BLOODED|BIO_JOINTED)
	limb_id = SPECIES_LUMINESCENT

/obj/item/bodypart/leg/left/luminescent
	biological_state = (BIO_FLESH|BIO_BLOODED|BIO_JOINTED)
	limb_id = SPECIES_LUMINESCENT

/obj/item/bodypart/leg/right/luminescent
	biological_state = (BIO_FLESH|BIO_BLOODED|BIO_JOINTED)
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	limb_id = SPECIES_LUMINESCENT

///ZOMBIE
/obj/item/bodypart/head/zombie
	limb_id = SPECIES_ZOMBIE
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	head_flags = HEAD_EYESPRITES|HEAD_DEBRAIN
	can_dismember = TRUE

/obj/item/bodypart/chest/zombie
	limb_id = SPECIES_ZOMBIE
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	wing_types = NONE

/obj/item/bodypart/arm/left/zombie
	limb_id = SPECIES_ZOMBIE
	should_draw_greyscale = FALSE

/obj/item/bodypart/arm/right/zombie
	limb_id = SPECIES_ZOMBIE
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/left/zombie
	limb_id = SPECIES_ZOMBIE
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/right/zombie
	limb_id = SPECIES_ZOMBIE
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/left/zombie/infectious
	limb_id = SPECIES_ZOMBIE
	should_draw_greyscale = FALSE
	speed_modifier = 0.8 //braaaaains

/obj/item/bodypart/leg/right/zombie/infectious
	limb_id = SPECIES_ZOMBIE
	should_draw_greyscale = FALSE
	speed_modifier = 0.8 //braaaaains

///PODPEOPLE
/obj/item/bodypart/head/pod
	limb_id = SPECIES_PODPERSON
	is_dimorphic = TRUE
	burn_modifier = 1.25
	head_flags = HEAD_EYESPRITES|HEAD_EYECOLOR|HEAD_EYEHOLES|HEAD_DEBRAIN

/obj/item/bodypart/chest/pod
	limb_id = SPECIES_PODPERSON
	is_dimorphic = TRUE
	burn_modifier = 1.25
	wing_types = NONE

/obj/item/bodypart/chest/pod/get_butt_sprite()
	return icon('icons/mob/butts.dmi', BUTT_SPRITE_FLOWERPOT)

/obj/item/bodypart/arm/left/pod
	limb_id = SPECIES_PODPERSON
	unarmed_attack_verbs = list("slash", "lash")
	grappled_attack_verb = "lacerate"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/weapons/slice.ogg'
	unarmed_miss_sound = 'sound/weapons/slashmiss.ogg'
	burn_modifier = 1.25

/obj/item/bodypart/arm/right/pod
	limb_id = SPECIES_PODPERSON
	unarmed_attack_verbs = list("slash", "lash")
	grappled_attack_verb = "lacerate"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/weapons/slice.ogg'
	unarmed_miss_sound = 'sound/weapons/slashmiss.ogg'
	burn_modifier = 1.25

/obj/item/bodypart/leg/left/pod
	limb_id = SPECIES_PODPERSON
	burn_modifier = 1.25

/obj/item/bodypart/leg/right/pod
	limb_id = SPECIES_PODPERSON
	burn_modifier = 1.25

///FLY
/obj/item/bodypart/head/fly
	limb_id = SPECIES_FLYPERSON
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	head_flags = HEAD_EYESPRITES|HEAD_EYEHOLES|HEAD_DEBRAIN

/obj/item/bodypart/chest/fly
	limb_id = SPECIES_FLYPERSON
	is_dimorphic = TRUE
	should_draw_greyscale = FALSE
	wing_types = list(/obj/item/organ/external/wings/functional/fly)

/obj/item/bodypart/arm/left/fly
	limb_id = SPECIES_FLYPERSON
	should_draw_greyscale = FALSE

/obj/item/bodypart/arm/right/fly
	limb_id = SPECIES_FLYPERSON
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/left/fly
	limb_id = SPECIES_FLYPERSON
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/right/fly
	limb_id = SPECIES_FLYPERSON
	should_draw_greyscale = FALSE

///SHADOW
/obj/item/bodypart/head/shadow
	limb_id = SPECIES_SHADOW
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	burn_modifier = 1.5
	head_flags = NONE

/obj/item/bodypart/chest/shadow
	limb_id = SPECIES_SHADOW
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	burn_modifier = 1.5
	wing_types = NONE

/obj/item/bodypart/arm/left/shadow
	limb_id = SPECIES_SHADOW
	should_draw_greyscale = FALSE
	burn_modifier = 1.5

/obj/item/bodypart/arm/right/shadow
	limb_id = SPECIES_SHADOW
	should_draw_greyscale = FALSE
	burn_modifier = 1.5

/obj/item/bodypart/leg/left/shadow
	limb_id = SPECIES_SHADOW
	should_draw_greyscale = FALSE
	burn_modifier = 1.5

/obj/item/bodypart/leg/right/shadow
	limb_id = SPECIES_SHADOW
	should_draw_greyscale = FALSE
	burn_modifier = 1.5

/obj/item/bodypart/arm/left/shadow/nightmare
	bodypart_traits = list(TRAIT_CHUNKYFINGERS)

/obj/item/bodypart/arm/right/shadow/nightmare
	bodypart_traits = list(TRAIT_CHUNKYFINGERS)

///SKELETON
/obj/item/bodypart/head/skeleton
	biological_state = BIO_BONE
	limb_id = SPECIES_SKELETON
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
	head_flags = NONE
	bodypart_flags = BODYPART_UNHUSKABLE

/obj/item/bodypart/chest/skeleton
	biological_state = BIO_BONE
	limb_id = SPECIES_SKELETON
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
	bodypart_flags = BODYPART_UNHUSKABLE
	wing_types = list(/obj/item/organ/external/wings/functional/skeleton)

/obj/item/bodypart/arm/left/skeleton
	biological_state = (BIO_BONE|BIO_JOINTED)
	limb_id = SPECIES_SKELETON
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
	bodypart_flags = BODYPART_UNHUSKABLE

/obj/item/bodypart/arm/right/skeleton
	biological_state = (BIO_BONE|BIO_JOINTED)
	limb_id = SPECIES_SKELETON
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
	bodypart_flags = BODYPART_UNHUSKABLE

/obj/item/bodypart/leg/left/skeleton
	biological_state = (BIO_BONE|BIO_JOINTED)
	limb_id = SPECIES_SKELETON
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
	bodypart_flags = BODYPART_UNHUSKABLE

/obj/item/bodypart/leg/right/skeleton
	biological_state = (BIO_BONE|BIO_JOINTED)
	limb_id = SPECIES_SKELETON
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
	bodypart_flags = BODYPART_UNHUSKABLE

///MUSHROOM
/obj/item/bodypart/head/mushroom
	limb_id = SPECIES_MUSHROOM
	is_dimorphic = TRUE
	burn_modifier = 1.25
	head_flags = NONE

/obj/item/bodypart/chest/mushroom
	limb_id = SPECIES_MUSHROOM
	is_dimorphic = TRUE
	bodypart_traits = list(TRAIT_NO_JUMPSUIT)
	burn_modifier = 1.25
	wing_types = NONE

/obj/item/bodypart/arm/left/mushroom
	limb_id = SPECIES_MUSHROOM
<<<<<<< HEAD
	unarmed_damage_low = 6
	unarmed_damage_high = 14
	unarmed_effectiveness = 15
	burn_modifier = 1.25

/obj/item/bodypart/arm/right/mushroom
	limb_id = SPECIES_MUSHROOM
	unarmed_damage_low = 6
	unarmed_damage_high = 14
	unarmed_effectiveness = 15
	burn_modifier = 1.25

/obj/item/bodypart/leg/left/mushroom
	limb_id = SPECIES_MUSHROOM
	unarmed_damage_low = 9
	unarmed_damage_high = 21
	unarmed_effectiveness = 20
	burn_modifier = 1.25
	speed_modifier = 0.75

/obj/item/bodypart/leg/right/mushroom
	limb_id = SPECIES_MUSHROOM
	unarmed_damage_low = 9
	unarmed_damage_high = 21
	unarmed_effectiveness = 20
	burn_modifier = 1.25
	speed_modifier = 0.75
=======
	unarmed_damage_low = 8
	unarmed_damage_high = 8
	unarmed_stun_threshold = 14

/obj/item/bodypart/arm/right/mushroom
	limb_id = SPECIES_MUSHROOM
	unarmed_damage_low = 8
	unarmed_damage_high = 8
	unarmed_stun_threshold = 14

/obj/item/bodypart/leg/left/mushroom
	limb_id = SPECIES_MUSHROOM
	unarmed_damage_low = 15
	unarmed_damage_high = 15
	unarmed_stun_threshold = 14

/obj/item/bodypart/leg/right/mushroom
	limb_id = SPECIES_MUSHROOM
	unarmed_damage_low = 15
	unarmed_damage_high = 15
	unarmed_stun_threshold = 14
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

/// Dullahan head preserves organs inside it
/obj/item/bodypart/head/dullahan
	throwforce = 25 // It's also a potent weapon
	show_organs_on_examine = FALSE
	speech_span = null

/obj/item/bodypart/head/dullahan/Entered(obj/item/organ/arrived, atom/old_loc, list/atom/old_locs)
	. = ..()
	if (!isorgan(arrived))
		return
	arrived.organ_flags |= ORGAN_FROZEN

/obj/item/bodypart/head/dullahan/Exited(obj/item/organ/gone, direction)
	. = ..()
	if (!isorgan(gone))
		return
	gone.organ_flags &= ~ORGAN_FROZEN


//GOLEM
/obj/item/bodypart/head/golem
<<<<<<< HEAD
	icon = 'icons/mob/human/species/golems.dmi'
	icon_static = 'icons/mob/human/species/golems.dmi'
	icon_state = "golem_head"
	biological_state = BIO_BONE
	bodytype = BODYTYPE_GOLEM | BODYTYPE_ORGANIC
=======
	biological_state = BIO_BONE
	bodytype = BODYTYPE_ORGANIC
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	limb_id = SPECIES_GOLEM
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
	head_flags = NONE

/obj/item/bodypart/head/golem/Initialize(mapload)
	worn_ears_offset = new(
		attached_part = src,
		feature_key = OFFSET_EARS,
		offset_x = list("north" = 1, "south" = -1, "east" = 1, "west" = -1),
		offset_y = list("south" = 1),
	)
	worn_glasses_offset = new(
		attached_part = src,
		feature_key = OFFSET_GLASSES,
		offset_x = list("north" = 1, "south" = -1, "east" = 1, "west" = -1),
	)
	worn_head_offset = new(
		attached_part = src,
		feature_key = OFFSET_HEAD,
		offset_x = list("north" = 1, "south" = -1, "east" = 1, "west" = -1),
		offset_y = list("south" = 1),
	)
	worn_face_offset = new(
		attached_part = src,
		feature_key = OFFSET_FACE,
		offset_x = list("north" = 1, "south" = -1, "east" = 1, "west" = -1),
	)
	return ..()

/obj/item/bodypart/chest/golem
<<<<<<< HEAD
	icon = 'icons/mob/human/species/golems.dmi'
	icon_static = 'icons/mob/human/species/golems.dmi'
	icon_state = "golem_chest"
	biological_state = BIO_BONE
	acceptable_bodytype = BODYTYPE_GOLEM
	bodytype = BODYTYPE_GOLEM | BODYTYPE_ORGANIC
=======
	biological_state = BIO_BONE
	acceptable_bodytype = BODYTYPE_ORGANIC
	bodytype =  BODYTYPE_ORGANIC
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	limb_id = SPECIES_GOLEM
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
	bodypart_traits = list(TRAIT_NO_JUMPSUIT)
	wing_types = NONE

/obj/item/bodypart/chest/golem/Initialize(mapload)
	worn_belt_offset = new(
		attached_part = src,
		feature_key = OFFSET_BELT,
		offset_x = list("north" = 1, "south" = -1, "east" = 1, "west" = -1),
	)
	return ..()

/obj/item/bodypart/arm/left/golem
<<<<<<< HEAD
	icon = 'icons/mob/human/species/golems.dmi'
	icon_static = 'icons/mob/human/species/golems.dmi'
	icon_state = "golem_l_arm"
	biological_state = (BIO_BONE|BIO_JOINTED)
	bodytype = BODYTYPE_GOLEM | BODYTYPE_ORGANIC
=======
	biological_state = (BIO_BONE|BIO_JOINTED)
	bodytype = BODYTYPE_ORGANIC
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	limb_id = SPECIES_GOLEM
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
<<<<<<< HEAD
	bodypart_traits = list(TRAIT_CHUNKYFINGERS, TRAIT_FIST_MINING)
	unarmed_damage_low = 5
	unarmed_damage_high = 14
	unarmed_effectiveness = 20

/obj/item/bodypart/arm/left/golem/Initialize(mapload)
	held_hand_offset =  new(
		attached_part = src,
		feature_key = OFFSET_HELD,
		offset_x = list("north" = -1, "south" = 2, "east" = 0, "west" = -3),
		offset_y = list("south" = -2),
	)
	return ..()

/obj/item/bodypart/arm/left/golem/clear_ownership(mob/living/carbon/old_owner)
	. = ..()

	old_owner.RemoveComponentSource(REF(src), /datum/component/shovel_hands)

/obj/item/bodypart/arm/left/golem/apply_ownership(mob/living/carbon/new_owner)
	. = ..()

	new_owner.AddComponentFrom(REF(src), /datum/component/shovel_hands)

/obj/item/bodypart/arm/right/golem
	icon = 'icons/mob/human/species/golems.dmi'
	icon_static = 'icons/mob/human/species/golems.dmi'
	icon_state = "golem_r_arm"
	biological_state = (BIO_BONE|BIO_JOINTED)
	bodytype = BODYTYPE_GOLEM | BODYTYPE_ORGANIC
	limb_id = SPECIES_GOLEM
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
	bodypart_traits = list(TRAIT_CHUNKYFINGERS, TRAIT_FIST_MINING)
	unarmed_damage_low = 5
	unarmed_damage_high = 14
	unarmed_effectiveness = 20

/obj/item/bodypart/arm/right/golem/Initialize(mapload)
	held_hand_offset =  new(
		attached_part = src,
		feature_key = OFFSET_HELD,
		offset_x = list("north" = 2, "south" = -2, "east" = 3, "west" = 0),
		offset_y = list("south" = -2),
	)
	return ..()

/obj/item/bodypart/arm/right/golem/clear_ownership(mob/living/carbon/old_owner)
	. = ..()

	old_owner.RemoveComponentSource(REF(src), /datum/component/shovel_hands)

/obj/item/bodypart/arm/right/golem/apply_ownership(mob/living/carbon/new_owner)
	. = ..()

	new_owner.AddComponentFrom(REF(src), /datum/component/shovel_hands)
=======
	bodypart_traits = list(TRAIT_CHUNKYFINGERS)
	unarmed_damage_low = 8 // I'd like to take the moment that maintaining all of these random ass golem speciese is hell and oranges was right
	unarmed_damage_high = 8
	unarmed_stun_threshold = 11

/obj/item/bodypart/arm/left/golem/set_owner(new_owner)
	. = ..()
	if (. == FALSE)
		return
	if (owner)
		owner.AddComponentFrom(REF(src), /datum/component/shovel_hands)
	if (isnull(.))
		return
	var/mob/living/carbon/old_owner = .
	old_owner.RemoveComponentSource(REF(src), /datum/component/shovel_hands)

/obj/item/bodypart/arm/right/golem
	biological_state = (BIO_BONE|BIO_JOINTED)
	bodytype =  BODYTYPE_ORGANIC
	limb_id = SPECIES_GOLEM
	dmg_overlay_type = null
	bodypart_traits = list(TRAIT_CHUNKYFINGERS)
	unarmed_damage_low = 8
	unarmed_damage_high = 8
	unarmed_stun_threshold = 11
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

/obj/item/bodypart/arm/right/golem/set_owner(new_owner)
	. = ..()
	if (. == FALSE)
		return
	if (owner)
		owner.AddComponentFrom(REF(src), /datum/component/shovel_hands)
	if (isnull(.))
		return
	var/mob/living/carbon/old_owner = .
	old_owner.RemoveComponentSource(REF(src), /datum/component/shovel_hands)

/obj/item/bodypart/leg/left/golem
<<<<<<< HEAD
	icon = 'icons/mob/human/species/golems.dmi'
	icon_static = 'icons/mob/human/species/golems.dmi'
	icon_state = "golem_l_leg"
	biological_state = (BIO_BONE|BIO_JOINTED)
	bodytype = BODYTYPE_GOLEM | BODYTYPE_ORGANIC
=======
	biological_state = (BIO_BONE|BIO_JOINTED)
	bodytype = BODYTYPE_ORGANIC
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	limb_id = SPECIES_GOLEM
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
<<<<<<< HEAD
	unarmed_damage_low = 7
	unarmed_damage_high = 21
	unarmed_effectiveness = 25

/obj/item/bodypart/leg/right/golem
	icon = 'icons/mob/human/species/golems.dmi'
	icon_static = 'icons/mob/human/species/golems.dmi'
	icon_state = "golem_r_leg"
	biological_state = (BIO_BONE|BIO_JOINTED)
	bodytype = BODYTYPE_GOLEM | BODYTYPE_ORGANIC
=======
	unarmed_damage_low = 11
	unarmed_damage_high = 11
	unarmed_stun_threshold = 11

/obj/item/bodypart/leg/right/golem
	biological_state = (BIO_BONE|BIO_JOINTED)
	bodytype = BODYTYPE_ORGANIC
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
	limb_id = SPECIES_GOLEM
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
<<<<<<< HEAD
	unarmed_damage_low = 7
	unarmed_damage_high = 21
	unarmed_effectiveness = 25
=======
	unarmed_damage_low = 11
	unarmed_damage_high = 11
	unarmed_stun_threshold = 11
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

///flesh

/obj/item/bodypart/arm/left/flesh
	limb_id = BODYPART_ID_MEAT
	should_draw_greyscale = FALSE

/obj/item/bodypart/arm/left/flesh/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_IGNORED_BY_LIVING_FLESH, BODYPART_TRAIT)
	AddElement(/datum/element/living_limb_initialiser)

/obj/item/bodypart/arm/right/flesh
	limb_id = BODYPART_ID_MEAT
	should_draw_greyscale = FALSE

/obj/item/bodypart/arm/right/flesh/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_IGNORED_BY_LIVING_FLESH, BODYPART_TRAIT)
	AddElement(/datum/element/living_limb_initialiser)

/obj/item/bodypart/leg/left/flesh
	limb_id = BODYPART_ID_MEAT
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/left/flesh/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_IGNORED_BY_LIVING_FLESH, BODYPART_TRAIT)
	AddElement(/datum/element/living_limb_initialiser)

/obj/item/bodypart/leg/right/flesh
	limb_id = BODYPART_ID_MEAT
	should_draw_greyscale = FALSE

<<<<<<< HEAD
/obj/item/bodypart/leg/right/flesh/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_IGNORED_BY_LIVING_FLESH, BODYPART_TRAIT)
	AddElement(/datum/element/living_limb_initialiser)
=======
/obj/item/bodypart/leg/left/golem/cult
	limb_id = SPECIES_GOLEM_CULT
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/right/golem/cult
	limb_id = SPECIES_GOLEM_CULT
	should_draw_greyscale = FALSE

///CLOTH GOLEM
/obj/item/bodypart/head/golem/cloth
	limb_id = SPECIES_GOLEM_CLOTH
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE

/obj/item/bodypart/chest/golem/cloth
	limb_id = SPECIES_GOLEM_CLOTH
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE

/obj/item/bodypart/arm/left/golem/cloth
	limb_id = SPECIES_GOLEM_CLOTH
	should_draw_greyscale = FALSE
	unarmed_damage_low = 7
	unarmed_stun_threshold = 7
	unarmed_damage_high = 8

/obj/item/bodypart/arm/right/golem/cloth
	limb_id = SPECIES_GOLEM_CLOTH
	should_draw_greyscale = FALSE
	unarmed_damage_low = 7
	unarmed_stun_threshold = 7
	unarmed_damage_high = 8

/obj/item/bodypart/leg/left/golem/cloth
	limb_id = SPECIES_GOLEM_CLOTH
	should_draw_greyscale = FALSE
	unarmed_damage_low = 7
	unarmed_stun_threshold = 7
	unarmed_damage_high = 12

/obj/item/bodypart/leg/right/golem/cloth
	limb_id = SPECIES_GOLEM_CLOTH
	should_draw_greyscale = FALSE
	unarmed_damage_low = 7
	unarmed_stun_threshold = 7
	unarmed_damage_high = 12

///CARDBOARD GOLEM
/obj/item/bodypart/head/golem/cardboard
	limb_id = SPECIES_GOLEM_CARDBOARD
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE

/obj/item/bodypart/chest/golem/cardboard
	limb_id = SPECIES_GOLEM_CARDBOARD
	is_dimorphic = TRUE
	should_draw_greyscale = FALSE

/obj/item/bodypart/arm/left/golem/cardboard
	limb_id = SPECIES_GOLEM_CARDBOARD
	should_draw_greyscale = FALSE
	unarmed_attack_verb = "whip"
	unarmed_attack_sound = 'sound/weapons/whip.ogg'
	unarmed_miss_sound = 'sound/weapons/etherealmiss.ogg'
	unarmed_damage_low = 7
	unarmed_stun_threshold = 7
	unarmed_damage_high = 8

/obj/item/bodypart/arm/right/golem/cardboard
	limb_id = SPECIES_GOLEM_CARDBOARD
	should_draw_greyscale = FALSE
	unarmed_attack_verb = "whip"
	unarmed_attack_sound = 'sound/weapons/whip.ogg'
	unarmed_miss_sound = 'sound/weapons/etherealmiss.ogg'
	unarmed_damage_low = 7
	unarmed_stun_threshold = 7
	unarmed_damage_high = 8

/obj/item/bodypart/leg/left/golem/cardboard
	limb_id = SPECIES_GOLEM_CARDBOARD
	should_draw_greyscale = FALSE
	unarmed_attack_sound = 'sound/weapons/whip.ogg'
	unarmed_miss_sound = 'sound/weapons/etherealmiss.ogg'
	unarmed_damage_low = 7
	unarmed_stun_threshold = 7
	unarmed_damage_high = 12

/obj/item/bodypart/leg/right/golem/cardboard
	limb_id = SPECIES_GOLEM_CARDBOARD
	should_draw_greyscale = FALSE
	unarmed_attack_sound = 'sound/weapons/whip.ogg'
	unarmed_miss_sound = 'sound/weapons/etherealmiss.ogg'
	unarmed_damage_low = 7
	unarmed_stun_threshold = 7
	unarmed_damage_high = 12

///DURATHREAD GOLEM
/obj/item/bodypart/head/golem/durathread
	limb_id = SPECIES_GOLEM_DURATHREAD
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE

/obj/item/bodypart/chest/golem/durathread
	limb_id = SPECIES_GOLEM_DURATHREAD
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE

/obj/item/bodypart/arm/left/golem/durathread
	limb_id = SPECIES_GOLEM_DURATHREAD
	should_draw_greyscale = FALSE

/obj/item/bodypart/arm/right/golem/durathread
	limb_id = SPECIES_GOLEM_DURATHREAD
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/left/golem/durathread
	limb_id = SPECIES_GOLEM_DURATHREAD
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/right/golem/durathread
	limb_id = SPECIES_GOLEM_DURATHREAD
	should_draw_greyscale = FALSE

///BONE GOLEM
/obj/item/bodypart/head/golem/bone
	biological_state = BIO_BONE
	limb_id = SPECIES_GOLEM_BONE
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE

/obj/item/bodypart/chest/golem/bone
	biological_state = BIO_BONE
	limb_id = SPECIES_GOLEM_BONE
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE

/obj/item/bodypart/arm/left/golem/bone
	biological_state = BIO_BONE
	limb_id = SPECIES_GOLEM_BONE
	should_draw_greyscale = FALSE

/obj/item/bodypart/arm/right/golem/bone
	biological_state = BIO_BONE
	limb_id = SPECIES_GOLEM_BONE
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/left/golem/bone
	biological_state = BIO_BONE
	limb_id = SPECIES_GOLEM_BONE
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/right/golem/bone
	biological_state = BIO_BONE
	limb_id = SPECIES_GOLEM_BONE
	should_draw_greyscale = FALSE

///SNOW GOLEM
/obj/item/bodypart/head/golem/snow
	limb_id = SPECIES_GOLEM_SNOW
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE

/obj/item/bodypart/chest/golem/snow
	limb_id = SPECIES_GOLEM_SNOW
	is_dimorphic = TRUE //WHO MADE SNOW BREASTS?
	should_draw_greyscale = FALSE

/obj/item/bodypart/arm/left/golem/snow
	limb_id = SPECIES_GOLEM_SNOW
	should_draw_greyscale = FALSE

/obj/item/bodypart/arm/right/golem/snow
	limb_id = SPECIES_GOLEM_SNOW
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/left/golem/snow
	limb_id = SPECIES_GOLEM_SNOW
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/right/golem/snow
	limb_id = SPECIES_GOLEM_SNOW
	should_draw_greyscale = FALSE

///URANIUM GOLEM
/obj/item/bodypart/arm/left/golem/uranium
	attack_type = BURN
	unarmed_attack_verb = "burn"
	unarmed_attack_sound = 'sound/weapons/sear.ogg'
	unarmed_damage_low = 1
	unarmed_damage_high = 10
	unarmed_stun_threshold = 9

/obj/item/bodypart/arm/right/golem/uranium
	attack_type = BURN
	unarmed_attack_verb = "burn"
	unarmed_attack_sound = 'sound/weapons/sear.ogg'
	unarmed_damage_low = 1
	unarmed_damage_high = 10
	unarmed_stun_threshold = 9

/obj/item/bodypart/leg/left/golem/uranium
	attack_type = BURN
	unarmed_attack_sound = 'sound/weapons/sear.ogg'
	unarmed_damage_low = 2
	unarmed_damage_high = 15
	unarmed_stun_threshold = 9

/obj/item/bodypart/leg/right/golem/uranium
	attack_type = BURN
	unarmed_attack_sound = 'sound/weapons/sear.ogg'
	unarmed_damage_low = 2
	unarmed_damage_high = 15
	unarmed_stun_threshold = 9

///PLASTEEL GOLEM
/obj/item/bodypart/arm/left/golem/plasteel
	unarmed_attack_verb = "smash"
	unarmed_attack_effect = ATTACK_EFFECT_SMASH
	unarmed_attack_sound = 'sound/effects/meteorimpact.ogg' //hits pretty hard
	unarmed_damage_low = 14
	unarmed_damage_high = 14
	unarmed_stun_threshold = 18

/obj/item/bodypart/arm/right/golem/plasteel
	unarmed_attack_verb = "smash"
	unarmed_attack_effect = ATTACK_EFFECT_SMASH
	unarmed_attack_sound = 'sound/effects/meteorimpact.ogg'
	unarmed_damage_low = 14
	unarmed_damage_high = 14
	unarmed_stun_threshold = 18


/obj/item/bodypart/leg/left/golem/plasteel
	unarmed_attack_effect = ATTACK_EFFECT_SMASH
	unarmed_attack_sound = 'sound/effects/meteorimpact.ogg'
	unarmed_damage_low = 22
	unarmed_damage_high = 22
	unarmed_stun_threshold = 18

/obj/item/bodypart/leg/right/golem/plasteel
	unarmed_attack_effect = ATTACK_EFFECT_SMASH
	unarmed_attack_sound = 'sound/effects/meteorimpact.ogg'
	unarmed_damage_low = 18
	unarmed_damage_high = 32
	unarmed_stun_threshold = 18

///BANANIUM GOLEM
/obj/item/bodypart/arm/left/golem/bananium
	unarmed_attack_verb = "honk"
	unarmed_attack_sound = 'sound/items/airhorn2.ogg'
	unarmed_damage_low = 0
	unarmed_damage_high = 1
	unarmed_stun_threshold = 2 //Harmless and can't stun

/obj/item/bodypart/arm/right/golem/bananium
	unarmed_attack_verb = "honk"
	unarmed_attack_sound = 'sound/items/airhorn2.ogg'
	unarmed_damage_low = 0
	unarmed_damage_high = 1
	unarmed_stun_threshold = 2

/obj/item/bodypart/leg/right/golem/bananium
	unarmed_attack_verb = "honk"
	unarmed_attack_sound = 'sound/items/airhorn2.ogg'
	unarmed_damage_low = 0
	unarmed_damage_high = 1
	unarmed_stun_threshold = 2

/obj/item/bodypart/leg/left/golem/bananium
	unarmed_attack_verb = "honk"
	unarmed_attack_sound = 'sound/items/airhorn2.ogg'
	unarmed_damage_low = 0
	unarmed_damage_high = 1
	unarmed_stun_threshold = 2
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
