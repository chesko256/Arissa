Scriptname MQ104PlayerScript extends ReferenceAlias
{used to detect player shouting}

Event OnSpellCast(Form akSpell)
; 	debug.trace(self + ": player cast " + akSpell)
	Spell castSpell = akSpell as Spell
; 	debug.trace(self + ": player cast " + castSpell)
	if castSpell && castSpell == ForcePushSpell
; 		debug.trace(self + ": " + castSpell + "==" + forcepushspell + ": setting stage 100")
		GetOwningQuest().SetStage(100)
	else
; 		debug.trace(self + ": " + castSpell + "<>" + forcepushspell + ": do nothing")
	endif
endevent

; detect when player equips Unrelenting Force shout
Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	if GetOwningQuest().GetStageDone(90) == 1 && GetOwningQuest().GetStageDone(92) == 0
; 		debug.trace(self + " player equipped " + akBaseObject)
		; for now just do it on anything equipped
		Shout equipShout = akBaseObject as Shout
		if equipShout == UnrelentingForceShout
			GetOwningQuest().setstage(92)
		endif
	endif
endEvent


Spell Property ForcePushSpell  Auto  
Shout Property UnrelentingForceShout Auto

; TEMP
location oldLoc
location newLoc

; detect when player enters various locations
Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	oldLoc = akOldLoc
	newLoc = akNewLoc
; 	debug.trace(self + ": OnLocationChange - akoldloc=" + akoldloc + ", aknewloc=" + aknewloc)

	; if player leaves Whiterun after learning of dragon attack, advance quest
	if GetOwningQuest().getStageDone(12) == 1 && GetOwningQuest().getStageDone(40) == 0
		if Game.GetPlayer().IsInLocation((GetOwningQuest() as MQ104Script).HQLocation) == 0
			GetOwningQuest().SetStage(30)
		endif
	endif

	; watch for player to enter fort location
	if GetOwningQuest().getStageDone(12) == 1 && GetOwningQuest().getStageDone(50) == 0
		if akNewLoc == (GetOwningQuest() as MQ104Script).FortLocation
			GetOwningQuest().SetStage(50)
		endif
	endif

	; wait for player to enter Solitude
	if GetOwningQuest().GetStageDone(90) == 1 && GetOwningQuest().GetStageDone(110) == 0
		if akNewLoc == (GetOwningQuest() as MQ104Script).HQLocation || akNewLoc == (GetOwningQuest() as MQ104Script).HighHrothgarLocation
			utility.Wait(6)
			GetOwningQuest().setstage(110)
		endif

		; failsafe timer - anytime the player changes location, check to see if time has expired
		if (GetOwningQuest() as MQ104Script).gameDaysPassed.GetValue() > (GetOwningQuest() as MQ104Script).greybeardSummonsTimer && GetActorRef().IsInCombat() == 0 && GetActorRef().GetParentCell().IsInterior() == 0
			GetOwningQuest().setstage(110)
		endif
	endif


endEvent

