/atom/proc/texttospeech(var/text)
	var/name2

	name2 = "\ref[src]"

	spawn(0)
		var/list/voiceslist = list()

		voiceslist["msg"] = text
		voiceslist["ckey"] = name2
		voiceslist["Voice"] = "Harry"
		var/params = list2params(voiceslist)

		text2file(params,"scripts/voicequeue.txt")

		//call("writevoice.dll", "writevoicetext")(params)

		shell("aeiou/Speak.exe")

		if(fexists("scripts/voicequeue.txt"))
			fdel("scripts/voicequeue.txt")

	spawn(10)
		if(fexists("sound/playervoices/[name2].wav"))
			for(var/mob/M in range(13))

				M.playsound_local(src.loc, "sound/playervoices/[name2].wav", 70)

	spawn(600)
		fdel("sound/playervoices/[name2].wav")

/client/proc/texttospeech(var/text, var/clientkey)
	spawn(0)
		var/list/voiceslist = list()

		voiceslist["msg"] = text
		voiceslist["ckey"] = clientkey
		voiceslist["Voice"] = "Harry"
		var/params = list2params(voiceslist)

		call_ext("aeiou/writevoice.dll", "writevoicetext")(params)
