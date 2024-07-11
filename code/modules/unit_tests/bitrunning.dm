/// Ensures settings on vdoms are correct
/datum/unit_test/bitrunner_vdom_settings

/datum/unit_test/bitrunner_vdom_settings/Run()
	var/obj/structure/closet/crate/secure/bitrunning/decrypted/cache = allocate(/obj/structure/closet/crate/secure/bitrunning/decrypted)

	for(var/path in subtypesof(/datum/lazy_template/virtual_domain))
		var/datum/lazy_template/virtual_domain/vdom = new path
		TEST_ASSERT_NOTNULL(vdom.key, "[path] should have a key")
		TEST_ASSERT_NOTNULL(vdom.map_name, "[path] should have a map name")

<<<<<<< HEAD
		if(!length(vdom.completion_loot))
			continue

		TEST_ASSERT_EQUAL(cache.spawn_loot(vdom.completion_loot), TRUE, "[path] didn't spawn loot. Completion loot should be an associative list")
=======
		if(!length(vdom.extra_loot))
			continue

		TEST_ASSERT_EQUAL(cache.spawn_loot(vdom.extra_loot), TRUE, "[path] didn't spawn loot. Extra loot should be an associative list")
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
