ScriptName CrimeGuardsScript extends Quest

ObjectReference Property CidhnaMineDoorA Auto
ObjectReference Property CidhnaMineDoorB Auto
ObjectReference Property CidhnaMineDoorLeverA Auto
ObjectReference Property CidhnaMineDoorLeverB Auto
Quest Property CidhnaMineJailEventScene Auto
GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property pCrimeGuildDisc Auto
FavorDialogueScript Property FavorScript  Auto
Faction Property pCrimeReach Auto
Faction Property pCrimeRift Auto
Faction Property pCrimeHaafingar Auto
Faction Property pCrimeEastmarch Auto
Faction Property pCrimeWhiterun Auto

Function SetupCidhnaMine()

	If CidhnaMineJailEventScene.GetStageDone(10) == 0
; 		debug.Trace("Running the Cidhna Mine intro scene")
		CidhnaMineJailEventScene.SetStage(10)
	EndIf

EndFunction

Function GuildDiscount(Actor pGuard)

	if pGuard.GetCrimeFaction() == pCrimeReach
		pCrimeGuildDisc.Value = pCrimeReach.GetCrimeGold() / 2
	elseif pGuard.GetCrimeFaction() == pCrimeRift
		pCrimeGuildDisc.Value = pCrimeRift.GetCrimeGold() / 2
	elseif pGuard.GetCrimeFaction() == pCrimeHaafingar
		pCrimeGuildDisc.Value = pCrimeHaafingar.GetCrimeGold() / 2
	elseif pGuard.GetCrimeFaction() == pCrimeEastmarch
		pCrimeGuildDisc.Value = pCrimeEastmarch.GetCrimeGold() / 2
	elseif pGuard.GetCrimeFaction() == pCrimeWhiterun
		pCrimeGuildDisc.Value = pCrimeWhiterun.GetCrimeGold() / 2
	endif

; 	Debug.Trace(self+"Guild gold check"+pCrimeGuildDisc.Value)

	UpdateCurrentInstanceGlobal(pCrimeGuildDisc)

endFunction

Function GuildPayoff(Actor pGuard)

	if pGuard.GetCrimeFaction() == pCrimeReach
		guildModifyCrimeGold(pCrimeReach)
		if Game.GetPlayer().IsTrespassing() == 0
			pCrimeReach.PlayerPayCrimeGold(false,false)
		elseif Game.GetPlayer().IsTrespassing() == 1
			pCrimeReach.PlayerPayCrimeGold(false,true)
		endif
	elseif pGuard.GetCrimeFaction() == pCrimeRift
		guildModifyCrimeGold(pCrimeRift)
		if Game.GetPlayer().IsTrespassing() == 0
			pCrimeRift.PlayerPayCrimeGold(false,false)
		elseif Game.GetPlayer().IsTrespassing() == 1
			pCrimeRift.PlayerPayCrimeGold(false,true)
		endif
	elseif pGuard.GetCrimeFaction() == pCrimeHaafingar
		guildModifyCrimeGold(pCrimeHaafingar)
		if Game.GetPlayer().IsTrespassing() == 0
			pCrimeHaafingar.PlayerPayCrimeGold(false,false)
		elseif Game.GetPlayer().IsTrespassing() == 1
			pCrimeHaafingar.PlayerPayCrimeGold(false,true)
		endif
	elseif pGuard.GetCrimeFaction() == pCrimeEastmarch
		guildModifyCrimeGold(pCrimeEastmarch)
		if Game.GetPlayer().IsTrespassing() == 0
			pCrimeEastmarch.PlayerPayCrimeGold(false,false)
		elseif Game.GetPlayer().IsTrespassing() == 1
			pCrimeEastmarch.PlayerPayCrimeGold(false,true)
		endif
	elseif pGuard.GetCrimeFaction() == pCrimeWhiterun
		guildModifyCrimeGold(pCrimeWhiterun)
		if Game.GetPlayer().IsTrespassing() == 0
			pCrimeWhiterun.PlayerPayCrimeGold(false,false)
		elseif Game.GetPlayer().IsTrespassing() == 1
			pCrimeWhiterun.PlayerPayCrimeGold(false,true)
		endif
	endif

endFunction

function guildModifyCrimeGold(Faction CrimeFaction)
	int crimeGoldViolent = CrimeFaction.GetCrimeGoldViolent()
	int crimeGoldNonviolent = CrimeFaction.GetCrimeGoldNonviolent()

	CrimeFaction.ModCrimeGold(-crimeGoldNonviolent, abViolent = False)
	CrimeFaction.ModCrimeGold(-crimeGoldViolent, abViolent = true)

	CrimeFaction.ModCrimeGold(pCrimeGuildDisc.GetValue() as int)

endFunction


; call to set variable03 on guard when he decides to ignore petty crimegold
function SetLastArrestTime(Actor pGuard)
	float nextTime = GameDaysPassed.GetValue() + 1.0
	pGuard.SetActorValue("Variable03", nextTime)
endfunction


; call this to bribe a guard to look the other way
function BribeGuard(Actor pGuard)
	; pay bribe
	FavorScript.Bribe(pGuard)
	; stop alarms
	Game.GetPlayer().StopCombatAlarm()
endFunction

function PersuadeGuard(Actor pGuard)
	;use Persuade
	FavorScript.ArrestPersuade(pGuard)
	; stop alarms
	Game.GetPlayer().StopCombatAlarm()
endFunction