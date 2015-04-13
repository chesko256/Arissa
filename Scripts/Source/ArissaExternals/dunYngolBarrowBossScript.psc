scriptName dunYngolBarrowBossScript extends objectReference
{logic control for Yngol Barrow fight}

formList property bones auto
{points to the "bones" of  Yngol}
effectShader property boneBurnFX auto
{effect to play on "burning" bones}
visualEffect property bigBurnFX auto
{effect to play on "burning" Yngol}
objectReference property Yngol auto
{ref of Yngol Boss}
quest property myQuest auto
{just in cast the quest isn't running already}

auto STATE active
	EVENT onTriggerEnter(objectReference actronaut)
		if actronaut == game.getPlayer()
			myQuest.start()
			; Enable Yngol's Shade
			;Yngol.Enable(true)
			; quick while loop to burn up the bones
			int total = bones.getSize()
; 			debug.trace("bones lise has "+total+" members")
			int i = 0
			while i < total
				; get the current bone in the list and "burn" it
				boneBurnFX.play(bones.getAt(i) as objectReference)
				i += 1
			endWhile
			;Yngol.knockAreaEffect(1,1024)
			bigBurnFX.play(Yngol)
			gotoState("inactive")
			Yngol.activate(actronaut)
			(Yngol as actor).startCombat(actronaut as actor)
		endif
	endEVENT
endSTATE
	
STATE inactive
endSTATE



