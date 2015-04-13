Scriptname MS10QuestScript extends Quest  Conditional

Book  Property Journal  Auto  
int Property RewardAmount Auto  
MiscObject Property RewardItem  Auto  
bool Property FightingStig  Auto  
bool Property KnowsNameOfPirates  Auto  Conditional
bool Property StigIntroduced Auto  Conditional
bool Property PlayerKnowsAboutHaldyn Auto  Conditional
bool Property AdelaisaFGInOffice Auto Conditional
bool Property StigPersuaded Auto Conditional
int Property BribeAmount  Auto  
MiscObject Property BribeItem  Auto  

ReferenceAlias Property Adelaisa auto
ReferenceAlias Property ShipInWindhelm auto
ReferenceAlias Property ShipDoorInWindhelm auto
ReferenceAlias Property Haldyn auto
ReferenceAlias Property ShipAtIsland auto
ObjectReference Property RemotePlayerTarget auto
ObjectReference Property RemoteAdelaisaTarget auto
ObjectReference Property LocalPlayerTarget auto
ObjectReference Property LocalAdelaisaTarget auto

ReferenceAlias Property Follower auto       ; on DialogueFollower
ReferenceAlias Property AnimalFollower auto ; on DialogueFollower
ObjectReference Property FollowerTarget auto
ObjectReference Property LocalFollowerTarget auto
ObjectReference Property AnimalFollowerTarget auto
ObjectReference Property LocalAnimalFollowerTarget auto


Function SetSail()
	Haldyn.GetReference().Enable()
	ShipAtIsland.GetReference().Enable()
	Game.GetPlayer().MoveTo(RemotePlayerTarget)
	ShipInWindhelm.GetReference().Disable()
	ShipDoorInWindhelm.GetReference().Disable()
	if (Follower.GetReference() != None)
		Follower.GetReference().MoveTo(FollowerTarget)
	endif
	if (AnimalFollower.GetReference() != None)
		AnimalFollower.GetReference().MoveTo(AnimalFollowerTarget)
	endif
	Adelaisa.GetReference().MoveTo(RemoteAdelaisaTarget)
	SetStage(42) ;insert some joke about the meaning of life here
EndFunction

Function HeadBackHome()
	ShipInWindhelm.GetReference().Enable()
	Game.GetPlayer().MoveTo(LocalPlayerTarget)
	if (Follower.GetReference() != None)
		Follower.GetReference().MoveTo(LocalFollowerTarget)
	endif
	if (AnimalFollower.GetReference() != None)
		AnimalFollower.GetReference().MoveTo(LocalAnimalFollowerTarget)
	endif
	Adelaisa.GetReference().MoveTo(LocalAdelaisaTarget)
	SetStage(80)
EndFunction

Function GetErDoneWithStig()
	StigPersuaded = True
EndFunction
