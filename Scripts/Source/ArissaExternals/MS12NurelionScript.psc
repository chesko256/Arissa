Scriptname MS12NurelionScript extends ReferenceAlias  

Package Property Convalescent auto
Message Property NurelionDying auto
ObjectReference Property NurelionBed auto

bool _inDeathBed = false

Event OnActivate(ObjectReference akActivator)
	if (GetActorReference().IsDead())
		return
	endif
	if (!_inDeathBed)
		return
	endif
	if ( (GetOwningQuest().GetStage() > 20) && (GetActorReference().GetCurrentPackage() == Convalescent) )
		NurelionDying.Show()
	endif
EndEvent

Event OnDeath(Actor akKiller)
	GetReference().BlockActivation(false)
EndEvent

Event OnSit(ObjectReference akFurniture)
	if (akFurniture == NurelionBed)
		_inDeathBed = true
		if (GetOwningQuest().GetStageDone(20))
			GetReference().BlockActivation(true)
		endif
	endif
EndEvent

Event OnGetUp(ObjectReference akFurniture)
	if (akFurniture == NurelionBed)
		_inDeathBed = false
	endif
EndEvent
