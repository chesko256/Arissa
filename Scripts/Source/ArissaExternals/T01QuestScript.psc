Scriptname T01QuestScript extends Quest Conditional

bool Property HamalDefinedSybil auto conditional
bool Property EnmonShouldFollow auto conditional
bool Property DegainedEnlisted auto conditional
bool Property HamalShouldConfront auto conditional
bool Property ProtocolSceneEnded auto conditional
bool Property PlayerGotPointerToEnmon auto conditional

Scene Property ProtocolScene auto
Faction Property MarkarthCrime auto
int Property AmountOfCrimeGold auto

ReferenceAlias Property Hamal auto
ReferenceAlias Property HamalEssential auto
ReferenceAlias Property Anwen auto
ReferenceAlias Property Orla auto
ReferenceAlias Property Senna auto
ReferenceAlias Property InnerSanctumDoor auto

bool Property PlayerJustHadToKeepGoing = false auto conditional
bool Property PlayerInInnerSanctum = false auto conditional


Function PlayerViolatedInnerSanctum()
	InnerSanctumDoor.GetReference().Lock()
	ProtocolScene.Stop()
	HamalShouldConfront = True
	Hamal.GetActorReference().EvaluatePackage()
	UnregisterForUpdate()
EndFunction

Function StuffHitsTheFan()
	HamalShouldConfront = False
	HamalEssential.Clear()
	Hamal.GetActorReference().EvaluatePackage()
	InnerSanctumDoor.GetReference().Lock(false)
	MarkarthCrime.ModCrimeGold(AmountOfCrimeGold)
	Hamal.GetActorReference().StartCombat(Game.GetPlayer())
	Anwen.GetActorReference().StartCombat(Game.GetPlayer())
	Orla.GetActorReference().StartCombat(Game.GetPlayer())
	Senna.GetActorReference().StartCombat(Game.GetPlayer())
EndFunction
