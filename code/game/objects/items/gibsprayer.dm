/obj/item/ammo_casing/energy/gibspray
	name = "gib sprayer casing"
	desc = "Why are you seeing this?!"
	projectile_type = /obj/projectile/bullet/gibspray
	icon = 'icons/effects/blood.dmi'
	icon_state = "gibup1"
	pellets = 7
	variance = 55
	select_name = "spray"
	e_cost = 0
	click_cooldown_override = 0.1


/*/obj/item/ammo_casing/energy/gibspray/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/caseless)
*/

/obj/projectile/bullet/gibspray
	name = "gib ball"
	desc = "A ball of gibs. Makes a big mess on impact."
	icon = 'icons/effects/blood.dmi'
	icon_state = "gibup1"
	damage = 0
	speed = 0.5
	embedding = null

/obj/projectile/bullet/gibspray/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/projectile_drop, /obj/effect/gibspawner/human)
	//RegisterSignal(src, COMSIG_PROJECTILE_ON_SPAWN_DROP, PROC_REF(handle_drop))

///obj/projectile/bullet/gibspray/proc/handle_drop(datum/source, /obj/effect/gibspawner/human/gibs)
//	SIGNAL_HANDLER

/obj/item/gun/energy/gibsprayer
	name ="gib sprayer"
	desc = "Does what it says on the tin."
	icon_state = "hellgun"
	inhand_icon_state = "gun"
	w_class = WEIGHT_CLASS_BULKY
	icon = 'icons/obj/weapons/guns/energy.dmi'
	ammo_type = list(/obj/item/ammo_casing/energy/gibspray)