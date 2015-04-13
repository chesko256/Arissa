Scriptname T03QuestScript extends Quest Conditional


bool Property PlayerAskedAboutTree Auto Conditional
bool Property PlayerHeardAboutNettlebane Auto Conditional
bool Property PlayerHeardAboutGildergreen Auto Conditional
bool Property PlayerShowedNettlebane Auto Conditional
bool Property PlayerHeardAboutEldergleam Auto Conditional

bool Property MauriceShouldFollow Auto Conditional
bool Property MauriceShouldIntro Auto Conditional
bool Property MauriceShouldAdmonish Auto Conditional
bool Property MauriceShouldTalkAtEnd Auto Conditional
bool Property PlayerTookSap Auto Conditional
bool Property RootOpened Auto Conditional

ReferenceAlias Property SprigganMarker auto
ReferenceAlias Property Maurice auto
Faction Property SprigganFaction auto
Faction Property T03HatePlayerFaction auto

Function StuffHitsTheFan()
	SprigganMarker.GetReference().Enable()
	Actor MauriceActor = Maurice.GetActorReference()
	if (MauriceActor.IsEnabled())
		MauriceActor.AddToFaction(SprigganFaction)
		MauriceActor.AddToFaction(T03HatePlayerFaction)
		MauriceActor.StartCombat(Game.GetPlayer())
	endif
EndFunction
