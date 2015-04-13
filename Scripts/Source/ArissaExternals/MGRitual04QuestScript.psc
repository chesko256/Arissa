Scriptname MGRitual04QuestScript extends Quest  Conditional

int Property testinfo  Auto  Conditional

int Property InTrigger  Auto  Conditional

int Property Blocker  Auto  Conditional

int Property TimerVar  Auto  Conditional

Scene Property MGRitual04AugurEndScene  Auto

ReferenceAlias Property Alias_Augur  Auto

ReferenceAlias Property Alias_ItemTrigger  Auto

ObjectReference Property FXMarker  Auto

Activator Property SummonFXActivator  Auto


Event OnUpdate()

if GetStage() == 20

	While (InTrigger == 0)
		FXMarker.PlaceAtMe(SummonFXActivator)
		Alias_ItemTrigger.GetReference().Enable()
		utility.Wait(3)
	endwhile

Endif


if GetStage() == 40 


	if TimerVar == 2
		Ghost01.GetReference().Enable(true)
	endif


	if TimerVar >= 10
		Ghost02.GetReference().Enable(true)
	endif

	if TimerVar >= 20
		Ghost03.GetReference().Enable(true)
	endif


	if TimerVar == 30
		While Ghost03.GetReference().IsEnabled() == True
			Ghost01.GetReference().Disable(true)
			Ghost02.GetReference().Disable(true)
			Ghost03.GetReference().Disable(true)
		endwhile
		Alias_Augur.GetReference().Enable()
		While Alias_Augur.GetReference().Is3DLoaded() == False
		Utility.Wait(2)
		endwhile
		MGRitual04AugurEndScene.Start()
		UnregisterforUpdate()
	endif
	TimerVar += 1
endif
EndEvent
ReferenceAlias Property Ghost01  Auto  

ReferenceAlias Property Ghost02  Auto  

ReferenceAlias Property Ghost03  Auto  
