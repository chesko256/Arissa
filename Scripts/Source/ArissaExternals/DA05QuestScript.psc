Scriptname DA05QuestScript extends Quest Conditional

bool Property MathiesToldStory Auto Conditional
bool Property SindingToldStory Auto Conditional
bool Property SindingMentionedHircine Auto Conditional
bool Property SindingToldAboutWitches Auto Conditional

bool Property PlayerCloseToSinding auto conditional
bool Property SindingCloseToPlayer auto conditional

int Property HuntersAlive Auto conditional

Location Property Falkreath Auto
GlobalVariable Property GameHour Auto
Scene Property FuneralScene Auto
Bool Property PlayerSawFuneral Auto Conditional
Bool Property PlayerTalkedToHunter Auto Conditional

Armor Property CursedRing auto
WorldSpace Property BloatedMansGrotto auto
Quest Property CompanionsCentralQuest auto
Spell Property WerewolfChange auto
Race Property WerewolfBeastRace auto

ReferenceAlias Property Sinding auto
Actor Property OriginalSinding auto

ReferenceAlias Property Hunter5 auto
ReferenceAlias Property Hunter6 auto
ReferenceAlias Property Hunter7 auto
ReferenceAlias Property Hunter8 auto
ReferenceAlias Property Hunter9 auto
ReferenceAlias Property Hunter10 auto
ReferenceAlias Property Hunter11 auto
ReferenceAlias Property Hunter12 auto

Function WaitForCallback()
; 	Debug.Trace("DA05: Registering for Sinding animation event.")
	RegisterForAnimationEvent(Sinding.GetActorReference(), "EscapeComplete")
EndFunction

Function KillHunter(Actor killed)
	HuntersAlive -= 1
	if (HuntersAlive <= 0 && GetStage() == 70)
		SetStage(80)
	endif
endFunction

Function CheckForSceneStart(Location newLocation)
	if (newLocation == Falkreath)
		int localTime = GameHour.GetValueInt()
		if ( (localTime < 22) && (localTime > 6) )
			; funeral takes place between 6am and 10pm
			if (!PlayerSawFuneral)
				; keep starting the scene until the player sees it (is actually in town during it)
				FuneralScene.Start()
			endif
		endif
	endif
EndFunction

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    if (asEventName == "EscapeComplete")
;     	Debug.Trace("DA05: Deleting human Sinding.")
        OriginalSinding.Disable()
		UnregisterForAnimationEvent(Sinding.GetActorReference(), "EscapeComplete")
    endif
EndEvent

Function RegisterAdditionalHunter(ObjectReference newHunter)
; 	Debug.Trace("DA05: Registering " + newHunter + " as additional hunter.")
	if (newHunter == None)
		return
	endif

	if     (Hunter5.GetReference() == None)
		Hunter5.ForceRefTo(newHunter)
	elseif (Hunter6.GetReference() == None)
		Hunter6.ForceRefTo(newHunter)
	elseif (Hunter7.GetReference() == None)
		Hunter7.ForceRefTo(newHunter)
	elseif (Hunter8.GetReference() == None)
		Hunter8.ForceRefTo(newHunter)
	elseif (Hunter9.GetReference() == None)
		Hunter9.ForceRefTo(newHunter)
	elseif (Hunter10.GetReference() == None)
		Hunter10.ForceRefTo(newHunter)
	elseif (Hunter11.GetReference() == None)
		Hunter11.ForceRefTo(newHunter)
	elseif (Hunter12.GetReference() == None)
		Hunter12.ForceRefTo(newHunter)
	endif
EndFunction

Event OnUpdateGameTime()
	if (!(CompanionsCentralQuest as CompanionsHousekeepingScript).PlayerHasBeastBlood)
; 		Debug.Trace("DA05: Player's not a werewolf; don't care.")
		return
	endif

	if (Game.GetPlayer().IsEquipped(CursedRing) && Game.GetPlayer().GetRace() != WerewolfBeastRace)
; 		Debug.Trace("DA05: Cursed ring trying to act...")
		if (!Game.GetPlayer().IsInInterior())
			if (Game.GetPlayer().GetWorldSpace() != BloatedMansGrotto)
				int roll = Utility.RandomInt(1, 10)
				if (roll == 1)
					; turn the player into a werewolf
; 					Debug.Trace("DA05: Cursed ring turning player.")
					WerewolfChange.Cast(Game.GetPlayer())
				else
; 					Debug.Trace("DA05: Cursed ring rolled a " + roll + "; don't care.")
				endif
			endif
		else
; 			Debug.Trace("DA05: Player's inside; don't care.")
		endif
	endif
EndEvent
