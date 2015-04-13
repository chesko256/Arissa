Scriptname ArenaCombatQuest extends Quest  

; Quest Property ParentQuest Auto
int Property TotalOpponents Auto

bool Property IsBluntedQuest = false Auto
bool Property IsTransitionFight = false auto

int _remainingOpponents = -1

int _currentWave = 0
int	_combatantsInCurrentWave = 0

Function Setup()
	_remainingOpponents = TotalOpponents
EndFunction

bool Function ShouldEnd()
	if (_remainingOpponents <= 0)
		return True
	else
		return False
	endif
EndFunction

Function PlayerEnteredArena()
; 	; Debug.Trace("ARENA: Player entered.")
	; if ( !(ParentQuest as ArenaScript).WagerOngoing )
	; 	Utility.Wait(10)
	; endif
	; NextWave()
EndFunction

Function NextWave()
	; if (ShouldEnd())
; 	; 	Debug.Trace("ARENA: Skipping wave because fight is over.")
	; 	return
	; endif

	; _currentWave += 1
; 	; Debug.Trace("ARENA: Starting wave " + _currentWave)

	; ; find the door we'll open
	; ObjectReference waveDoor = (ParentQuest as ArenaScript).GetDoorForWave(_currentWave)
	; if (waveDoor == None)
; 	; 	Debug.Trace("ARENA ERROR: Couldn't find spawn point for wave " + _currentWave, 2)
	; 	return
	; endif

	; ; count how many things in this wave
	; Keyword waveKeyword = (ParentQuest as ArenaScript).GetKeywordForWave(_currentWave)
	; int cIndex = 1
	; ReferenceAlias cRA = None
	; bool keepCounting = True
	; _combatantsInCurrentWave = 0
	; while(keepCounting)
	; 	cRA = (ParentQuest as ArenaScript).GetCombatantAlias(cIndex)
	; 	Actor cA = cra.GetActorReference()
	; 	if (cA == None)
	; 		keepCounting = False
	; 	elseif (cA.HasKeyword(waveKeyword))
	; 		_combatantsInCurrentWave += 1
	; 		ArenaScript aScript = (ParentQuest as ArenaScript)
	; 		Actor target = None
	; 		if (aScript.WagerOngoing)
	; 			target = (aScript.ArenaWagerFighterQuest as ArenaWagerFighterQuestScript).Fighter.GetActorReference()
	; 		else
	; 			target = Game.GetPlayer()
	; 		endif
; 	; 		Debug.Trace("ARENA: " + cA + " starting combat with " + target)
	; 		cA.RemoveFromFaction(aScript.PacifyFaction)
	; 		cA.EvaluatePackage()
	; 		cA.StartCombat(target)
	; 	endif
	; 	cIndex += 1
	; endwhile

	; if (waveDoor != (ParentQuest as ArenaScript).PitDoor.GetReference())
	; 	; let loose the dogs of war
; 	; 	Debug.Trace("ARENA: Trying to open wave door -- " + waveDoor)
	; 	Utility.Wait(5)
	; 	waveDoor.SetOpen(True)
	; else
	; 	; unless they're already out
	; endif
EndFunction

Function OpponentDowned()
; 	; Debug.Trace("ARENA: Killed opponent -- " + _remainingOpponents + ", " + _combatantsInCurrentWave)
	; _remainingOpponents -= 1
	; if (ShouldEnd())
	; 	SetStage(200)
	; 	return
	; endif

	; _combatantsInCurrentWave -= 1
	; if (_combatantsInCurrentWave <= 0)
	; 	NextWave()
	; endif
EndFunction

Function Cleanup()
	; ; ARE YOU NOT ENTERTAINED?!
	; (ParentQuest as ArenaScript).CombatOver()
EndFunction


