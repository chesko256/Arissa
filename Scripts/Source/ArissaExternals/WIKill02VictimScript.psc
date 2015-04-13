Scriptname WIKill02VictimScript extends ReferenceAlias 
{Makes the victim a ghost when player leaves, and causes victim to haunt the relative after enough days pass.}

WIKill02Script vMyQuest

Spell Property GhostAbilityNew Auto
Spell Property GhostResistsAbility Auto

Event OnInit()
	;*** !!! THERE IS A BUG WITH OnInit() NOT FIRING ON ALIAS SCRIPTS.... SO YOU MIGHT NEED TO SET UP YOUR VARIABLE TO QUEST SCRIPT SOMEWHERE ELSE TO GET THIS WORKING IN THE MEANTIM
; 	debug.trace("WIKill02VictimScript onInit() event has fired.")
	vMyQuest = GetOwningQuest() as WIKill02Script
EndEvent

Event OnLoad()
	if vMyQuest.pGhostState >= 1
	
		debug.messageBox("WIKill02VictimScript: making victime a ghost.")

		Actor selfActor = GetActorReference()
		
		selfActor.addSpell(GhostAbilityNew)
		selfActor.addSpell(GhostResistsAbility)
		
		selfActor.GetActorBase().SetInvulnerable(true)
		selfActor.SetGhost(true)
		
	endif

EndEvent
