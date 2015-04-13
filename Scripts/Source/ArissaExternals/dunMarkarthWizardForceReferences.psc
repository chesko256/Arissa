scriptName dunMarkarthWizardForceReferences extends objectReference
{Updates references and positions for NPCs in the Wizards' Quarters.}

Quest property dunMarkarthWizardQST Auto
Quest property TG06 Auto
Quest property CW Auto

ReferenceAlias property Gallery_Guard01 Auto
ReferenceAlias property Gallery_Guard02 Auto
ReferenceAlias property Gallery_Guard03 Auto
ReferenceAlias property Lab_Guard01 Auto
ReferenceAlias property Lab_Guard02 Auto
ReferenceAlias property Lab_Guard03 Auto
ReferenceAlias property Lab_Guard04 Auto
ReferenceAlias property Lab_Guard05 Auto
ReferenceAlias property Lab_Guard06 Auto
ReferenceAlias property Lab_Guard07 Auto
ReferenceAlias property Aicantar Auto

ReferenceAlias property Gallery_Guard01_Imp Auto
ReferenceAlias property Gallery_Guard02_Imp Auto
ReferenceAlias property Gallery_Guard03_Imp Auto
ReferenceAlias property Gallery_Guard01_Sons Auto
ReferenceAlias property Gallery_Guard02_Sons Auto
ReferenceAlias property Gallery_Guard03_Sons Auto

ReferenceAlias property Lab_Guard_Normal Auto
ReferenceAlias property Lab_Guard_Imp Auto
ReferenceAlias property Lab_Guard_Sons Auto

ObjectReference property LabPost1 Auto
ObjectReference property LabPost2 Auto
ObjectReference property LabPost3 Auto
ObjectReference property LabPost4 Auto
ObjectReference property LabPost5 Auto
ObjectReference property LabPost6 Auto
ObjectReference property LabPost7 Auto
ObjectReference property LabPost8 Auto
ObjectReference property NormalGuardPosition Auto
ObjectReference property AicantarLabPosition Auto
ObjectReference property AicantarSafetyPosition Auto
ObjectReference property LabAmbushMarker1 Auto

Cell property MarkarthWizardsQuarters02Cell Auto
Faction property MarkarthWizardsFaction Auto

ObjectReference property TowerPost1 Auto
ObjectReference property TowerPost2 Auto
ObjectReference property TowerPost3 Auto
ObjectReference property TowerPost4 Auto

Keyword property LinkCustom01 Auto


ObjectReference property MuseumLockedDoor Auto
ObjectReference property LabLockedDoor Auto
Light property Torch Auto
int property WizardsQuartersStartupStage Auto
bool doOnce = False

Weapon property MarkarthWizardSpiderStaff Auto
Weapon property MarkarthWizardSpiderStaffDud Auto
Location property Quarters02 Auto

Event OnLoad()
	if (!dunMarkarthWizardQST.IsRunning())
		dunMarkarthWizardQST.SetStage(0)
	Else
		; Assign guards to Aliases depending on who controls Markarth at the moment.
		CWScript CWs = (CW As CWScript)	
		if (CWs.OwnerReach == 0 || CWs.OwnerReach == 1) ;Imperial
			Gallery_Guard01.ForceRefTo(Gallery_Guard01_Imp.GetActorReference())
			Gallery_Guard02.ForceRefTo(Gallery_Guard02_Imp.GetActorReference())
			Gallery_Guard03.ForceRefTo(Gallery_Guard03_Imp.GetActorReference())
			Lab_Guard_Normal.ForceRefTo(Lab_Guard_Imp.GetActorReference())
		Else
			Gallery_Guard01.ForceRefTo(Gallery_Guard01_Sons.GetActorReference())
			Gallery_Guard02.ForceRefTo(Gallery_Guard02_Sons.GetActorReference())
			Gallery_Guard03.ForceRefTo(Gallery_Guard03_Sons.GetActorReference())
			Lab_Guard_Normal.ForceRefTo(Lab_Guard_Sons.GetActorReference())
		EndIf

		;Set up Guards
		if (dunMarkarthWizardQST.GetStage() >= 10)
			if (Lab_Guard01.GetActorReference().GetActorValue("Variable01") == 0)
				;MarkarthWizardsQuarters02Cell.SetFactionOwner(None)
				Gallery_Guard01.GetActorReference().MoveTo(Gallery_Guard01.GetActorReference().GetLinkedRef(LinkCustom01))
				Gallery_Guard02.GetActorReference().MoveTo(Gallery_Guard02.GetActorReference().GetLinkedRef(LinkCustom01))
				Gallery_Guard03.GetActorReference().MoveTo(Gallery_Guard03.GetActorReference().GetLinkedRef())
				Lab_Guard01.GetActorReference().MoveTo(Lab_Guard01.GetActorReference().GetLinkedRef(LinkCustom01))
				Lab_Guard02.GetActorReference().MoveTo(Lab_Guard02.GetActorReference().GetLinkedRef(LinkCustom01))
				Lab_Guard03.GetActorReference().MoveTo(Lab_Guard03.GetActorReference().GetLinkedRef(LinkCustom01))
				Lab_Guard04.GetActorReference().MoveTo(Lab_Guard04.GetActorReference().GetLinkedRef(LinkCustom01))
				Lab_Guard05.GetActorReference().MoveTo(Lab_Guard05.GetActorReference().GetLinkedRef(LinkCustom01))
				Lab_Guard06.GetActorReference().MoveTo(Lab_Guard06.GetActorReference().GetLinkedRef(LinkCustom01))
				Lab_Guard07.GetActorReference().MoveTo(Lab_Guard07.GetActorReference().GetLinkedRef(LinkCustom01))
				Lab_Guard_Normal.GetActorReference().MoveTo(LabPost8)
				Lab_Guard01.GetActorReference().SetActorValue("Variable01", 1)
			EndIf
		Else
			;MarkarthWizardsQuarters02Cell.SetFactionOwner(MarkarthWizardsFaction)
			Lab_Guard01.GetActorReference().MoveTo(LabPost1)
			Lab_Guard02.GetActorReference().MoveTo(LabPost2)
			Lab_Guard03.GetActorReference().MoveTo(LabPost3)
			Lab_Guard04.GetActorReference().MoveTo(LabPost4)
			Lab_Guard05.GetActorReference().MoveTo(LabPost5)
			Lab_Guard06.GetActorReference().MoveTo(LabPost6)	
			Lab_Guard07.GetActorReference().MoveTo(LabPost7)	
			Lab_Guard_Normal.GetActorReference().MoveTo(NormalGuardPosition)
		EndIf

		if (Aicantar.GetActorReference().IsDead())
			Aicantar.GetActorReference().Disable()
		Else
			if (TG06.GetStage() > 0 && TG06.GetStage() < 20)
				Aicantar.GetActorReference().MoveTo(AicantarSafetyPosition)
			ElseIf (TG06.GetStage() >= 20 && dunMarkarthWizardQST.GetStage() < 20)
				if (Aicantar.GetActorReference().GetActorValue("Variable01") == 0)
					Aicantar.GetActorReference().MoveTo(AicantarLabPosition)
					Aicantar.GetActorReference().SetActorValue("Variable01", 1)
				EndIf
			EndIf
		EndIf

		if (dunMarkarthWizardQST.GetStage() >= 100)
			LabAmbushMarker1.Disable()
		EndIf
	
		if (Game.GetPlayer().GetItemCount(MarkarthWizardSpiderStaff) > 0 && Game.GetPlayer().GetCurrentLocation() != Quarters02)
			bool wasEquipped = Game.GetPlayer().IsEquipped(MarkarthWizardSpiderStaff)
			Game.GetPlayer().RemoveItem(MarkarthWizardSpiderStaff, 1, True)
			if (wasEquipped)
				Game.GetPlayer().EquipItem(MarkarthWizardSpiderStaffDud, False, True)
			Else
				Game.GetPlayer().AddItem(MarkarthWizardSpiderStaffDud, 1, True)
			EndIf
		ElseIf (Game.GetPlayer().GetItemCount(MarkarthWizardSpiderStaffDud) > 0 && Game.GetPlayer().GetCurrentLocation() == Quarters02)
			bool wasEquipped = Game.GetPlayer().IsEquipped(MarkarthWizardSpiderStaffDud)
			Game.GetPlayer().RemoveItem(MarkarthWizardSpiderStaffDud, 1, True)
			if (wasEquipped)
				Game.GetPlayer().EquipItem(MarkarthWizardSpiderStaff, False, True)
			Else
				Game.GetPlayer().AddItem(MarkarthWizardSpiderStaff, 1, True)
			EndIf
		EndIf
	EndIf
EndEvent


