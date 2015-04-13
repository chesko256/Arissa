Scriptname CR03QuestScript extends CompanionsRadiantQuest conditional

ReferenceAlias Property SamplePelt auto
ReferenceAlias Property SamplePeltSpawnPoint auto

int Property UpdateInterval auto

int Property MinSkins auto
int Property MaxSkins auto

MiscObject Property BearCave auto
MiscObject Property Bear auto
MiscObject Property BearSnow auto
MiscObject Property SabreCat auto
MiscObject Property SabreCatSnow auto
MiscObject Property WolfIce auto
MiscObject Property Wolf auto

int targetNumberOfSkins = -1
int currentNumberOfSkins = -1
GlobalVariable Property TotalNeeded auto
GlobalVariable Property PeltsGotten auto
MiscObject TargetSkins = None
int Property TargetSkinsIndex auto conditional

Function Setup()
	targetNumberOfSkins = Utility.RandomInt(MinSkins, MaxSkins)
	TotalNeeded.value = targetNumberOfSkins
	currentNumberOfSkins = 0
	PeltsGotten.value = currentNumberOfSkins
	UpdateCurrentInstanceGlobal(TotalNeeded)
	UpdateCurrentInstanceGlobal(PeltsGotten)
		
	TargetSkinsIndex = Utility.RandomInt(1, 7)
	if     (TargetSkinsIndex == 1)
		TargetSkins = Bear ;BearCave
	elseif (TargetSkinsIndex == 2)
		TargetSkins = Bear
	elseif (TargetSkinsIndex == 3)
		TargetSkins = Bear ;BearSnow
	elseif (TargetSkinsIndex == 4)
		TargetSkins = SabreCat
	elseif (TargetSkinsIndex == 5)
		TargetSkins = SabreCat ;SabreCatSnow
	elseif (TargetSkinsIndex == 6)
		TargetSkins = Wolf ; WolfIce
	elseif (TargetSkinsIndex == 7)
		TargetSkins = Wolf
	else
		TargetSkinsIndex = 1
		TargetSkins = Bear ;BearCave
	endif
	
	if (TargetNumberOfSkins <= 0)
		TargetNumberOfSkins = 7
	endif
	
	ObjectReference pelt = SamplePeltSpawnPoint.GetReference().PlaceAtMe(TargetSkins)
	SamplePelt.ForceRefTo(pelt)
	
	parent.Setup()
EndFunction

Function Accepted()
	RegisterForUpdate(UpdateInterval)
	
	parent.Accepted()
EndFunction

Function Finished(bool _succeeded = true, bool _finished = true)	
	parent.Finished(_succeeded, _finished)
EndFunction

Function Cleanup()
	UnRegisterForUpdate()
	Game.GetPlayer().RemoveItem(TargetSkins, TargetNumberOfSkins)
	
	ObjectReference pelt = SamplePelt.GetReference()
	SamplePelt.Clear()
	pelt.Disable()
	pelt.Delete()
	
	parent.Cleanup()
EndFunction

Event OnUpdate()
	int currentSkins = Game.GetPlayer().GetItemCount(TargetSkins)
	if (currentSkins == currentNumberOfSkins)
		return
	else
; 		Debug.Trace("CRQ CR03: currentSkins=" + currentSkins + "; currentNumberOfSkins=" + currentNumberOfSkins)
	endif
	
	PeltsGotten.value = currentSkins
	UpdateCurrentInstanceGlobal(PeltsGotten)
	
	if (currentSkins >= TargetNumberOfSkins)
		SetStage(20)
		SetObjectiveCompleted(10, 1)
		Finished(true, true)
	elseif (GetStageDone(20))
		; at one point we had enough, but lost some
		SetObjectiveCompleted(10, 0)
		SetObjectiveDisplayed(10, 1, True)
		Finished(false, false)
	else
		; still not enough... the hippos will always be hungry
		SetObjectiveDisplayed(10, 1, True)
		Finished(false, false)
	endif
		
	currentNumberOfSkins = currentSkins
EndEvent
