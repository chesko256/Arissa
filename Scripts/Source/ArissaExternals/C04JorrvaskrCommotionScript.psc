Scriptname C04JorrvaskrCommotionScript extends Quest  

ReferenceAlias Property RangedGateCompanion auto
ReferenceAlias Property MeleeTreeCompanion auto
ReferenceAlias Property Gawker1 auto
ReferenceAlias Property Gawker2 auto
ReferenceAlias Property Gawker3 auto
ReferenceAlias Property Gawker4 auto

ReferenceAlias Property Vilkas auto
Armor Property VilkasHelmet auto

Actor Property Aela auto
Actor Property Torvar auto
Actor Property Athis auto

ObjectReference Property GateSpot auto
ObjectReference Property TreeSpot auto
ObjectReference Property Gawker1Spot auto
ObjectReference Property Gawker2Spot auto
ObjectReference Property Gawker3Spot auto
ObjectReference Property Gawker4Spot auto

ObjectReference Property KodlakHammer auto

ObjectReference Property BasementDoor auto
Scene Property BlockingScene auto

CompanionsBladeFragmentTracking Property FragmentTracking auto

Function Setup()
	FragmentTracking.AllFragmentsStolen()

	MeleeTreeCompanion.ForceRefTo(Aela)
	if     (!Torvar.IsDead())
		RangedGateCompanion.ForceRefTo(Torvar)
	elseif (!Athis.IsDead())
		RangedGateCompanion.ForceRefTo(Athis)
	endif

	RangedGateCompanion.GetReference().MoveTo(GateSpot)
	MeleeTreeCompanion.GetReference().MoveTo(TreeSpot)

	if (Gawker1.GetReference())
		Gawker1.GetReference().MoveTo(Gawker1Spot)
	endif
	if (Gawker2.GetReference())
		Gawker2.GetReference().MoveTo(Gawker2Spot)
	endif
	if (Gawker3.GetReference())
		Gawker3.GetReference().MoveTo(Gawker3Spot)
	endif
	if (Gawker4.GetReference())
		Gawker4.GetReference().MoveTo(Gawker4Spot)
	endif

	KodlakHammer.Disable()

	Vilkas.GetActorReference().AddItem(VilkasHelmet, 1)
	Vilkas.GetActorReference().EquipItem(VilkasHelmet)
EndFunction


Function Teardown()
	BlockingScene.Stop()
EndFunction
