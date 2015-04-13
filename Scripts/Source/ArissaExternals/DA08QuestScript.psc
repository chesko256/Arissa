Scriptname DA08QuestScript extends Quest Conditional

bool Property NelkirShouldForceGreet auto conditional
bool Property FrotharShouldForceGreet auto conditional

bool Property TurnedNelkir auto conditional
bool Property TurnedDagny auto conditional
bool Property TurnedFrothar auto conditional

bool Property LearnedAboutNelkir auto conditional
bool Property LearnedAboutFrothar auto conditional
bool Property LearnedAboutDagny auto conditional

bool Property PlayerGotRumor auto conditional

bool Property ChildrenExiled auto conditional

Weapon Property RealEbonyBlade auto

ReferenceAlias Property EbonyBlade auto
ReferenceAlias Property Balgruuf auto
ReferenceAlias Property Nelkir auto
ReferenceAlias Property Dagny auto
ReferenceAlias Property Frothar auto
ReferenceAlias Property Karinda auto
ReferenceAlias Property KarindaEssential auto

ObjectReference Property AltBalgruufSpot auto
ObjectReference Property AltProventusSpot auto
ObjectReference Property AltFrotharSpot auto
ObjectReference Property AltNelkirSpot auto
ObjectReference Property AltDagnySpot auto
ObjectReference Property AltProventusSealedDoor auto

Faction Property DragonsreachOccupants auto

bool Property PlayerOutsideJarlsQuarters auto
bool Property FrotharOutsideJarlsQuarters auto

Faction Property DeposedFaction auto

Function FrotharGoesNuts()
	;Karinda.GetActorReference().Kill()
	KarindaEssential.GetActorReference().GetActorBase().SetInvulnerable(false)
	KarindaEssential.GetActorReference().SetAV("health", 1)
	KarindaEssential.Clear()
	Frothar.GetActorReference().SetAV("confidence", 4)
	Frothar.GetActorReference().StartCombat(Karinda.GetActorReference())
EndFunction


Function Cleanup()
EndFunction


Function PlayerMoving()
	if (!ChildrenExiled && GetStage() >= 110)
		ChildrenExiled = True
		; PlayerWatched.Clear()
		Dagny.GetReference().Disable()
		Nelkir.GetReference().Disable()
	endif
EndFunction

Function WhiterunSiegeHappening(bool isHappening)
	if (isHappening)
		; handle what happens if the siege starts up during this quest
		Karinda.GetReference().Disable()
	else
		; handle what happens if the siege stops during this quest
		Karinda.GetReference().Enable()
	endif
EndFunction
