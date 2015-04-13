Scriptname DA05SindingScript extends ReferenceAlias  

Quest Property DA05 Auto 

Message Property SkinMessage Auto
ReferenceAlias Property SindingSkin Auto
ReferenceAlias Property SindingGhost auto

Event OnDeath(Actor akKiller)
	; 74822 handling properly if Sinding dies before quest has popped
	if (DA05.GetStage() < 10)
		DA05.SetStage(210)
	; /74822
	elseif (DA05.GetStage() == 10)
		DA05.SetStage(205)
	elseif (DA05.GetStage() >= 20)
		DA05.SetStage(61)
	endif
EndEvent

Event OnDying(Actor akKiller)
	GetReference().BlockActivation(true)
EndEvent

Event OnActivate(ObjectReference akActionRef)
	if (    GetActorReference().IsDead() && (   (DA05.GetStage() == 60) || (  (DA05.GetStageDone(61) == True) && (DA05.GetStageDone(65) == False)  )   )    )
		int response = SkinMessage.Show()
		if (response == 0)
			Game.GetPlayer().AddItem(SindingSkin.GetReference(), 1)
			GetOwningQuest().SetStage(65)
			GetReference().BlockActivation(false)
			GetReference().SetMotionType(3) ; Motion_Keyframed
			SindingGhost.GetReference().MoveTo(GetReference())
			SindingGhost.GetReference().Enable(true)
			SindingGhost.GetActorReference().SetNoFavorAllowed(true)
		endif
	else
		;GetReference().Activate(akActionRef)
	endif
endEvent 
