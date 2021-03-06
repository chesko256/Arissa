Scriptname _Arissa_PlayerActivityMonitor extends ReferenceAlias  
{Monitors the player's actions and quest states. Runs persistently.}

_Arissa_iNPC_Behavior Property iNPCSystem auto
GlobalVariable property _Arissa_CurrentTownRoamArea auto
GlobalVariable property _Arissa_HelpShown_TownRoam auto
GlobalVariable property RecoverArissa auto
Actor property PlayerRef auto
Quest property MainQuest auto
Quest property _Arissa_Commentary_EquipmentReactions auto
Quest property _Arissa_MQ01 auto
Quest property _Arissa_MQ02 auto
Armor property ArmorDraugrCuirass auto
Keyword property ArmorCuirass auto
Keyword property ArmorMaterialIron auto
Keyword property ArmorMaterialIronBanded auto
Keyword property ArmorMaterialSteel auto
Keyword property ArmorMaterialSteelPlate auto
Keyword property ArmorMaterialImperialHeavy auto
Keyword property ArmorMaterialImperialLight auto
Keyword property ArmorMaterialImperialStudded auto
Keyword property ArmorMaterialPenitus auto
Keyword property ArmorMaterialLeather auto
Keyword property ArmorMaterialScaled auto
Keyword property ArmorMaterialStormcloak auto
Keyword property ArmorMaterialStudded auto
Keyword property ArmorMaterialHide auto
Keyword property ArmorMaterialDwarven auto
Keyword property ArmorMaterialEbony auto
Keyword property ArmorMaterialOrcish auto
message property _ArissaTownRoamEndMessage auto
message property _ArissaHelpTownRoam auto

ObjectReference property WindhelmLocationCenterMarkerREF auto
ObjectReference property CenterMarkerRfiten auto
ObjectReference property _Arissa_MarkarthCenterMarker auto
ObjectReference property CenterMarkerWhiterun auto
ObjectReference property SolitudeCenterMarker auto
ObjectReference property CenterMarkerDawnstar auto
ObjectReference property CenterMarkerFalkreath auto
ObjectReference property CenterMarkerMorthal auto

Worldspace property WindhelmWorld auto
Worldspace property RiftenWorld auto
Worldspace property MarkarthWorld auto
Worldspace property WhiterunWorld auto
Worldspace property SolitudeWorld auto

Location property WindhelmLocation auto
Location property RiftenLocation auto
Location property MarkarthLocation auto
Location property WhiterunLocation auto
Location property SolitudeLocation auto
Location property DawnstarLocation auto
Location property FalkreathLocation auto
Location property MorthalLocation auto

Potion property FoodApple auto
Potion property FoodMead auto

int MQ02Counter = 2

Event OnInit()
	RegisterForSingleUpdate(3)
	RegisterForSingleUpdateGameTime(24)
endEvent

function ReInit()
	RegisterForSingleUpdate(3)
	RegisterForSingleUpdateGameTime(24)
endFunction

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	if (MainQuest as _Arissa_iNPC_Behavior).IsFollowingAndNearPlayer()
		ProcessObjectEquipped(akBaseObject, akReference)
	endif
endEvent

function ProcessObjectEquipped(Form akBaseObject, ObjectReference akReference)
	if akBaseObject as Armor
		if akBaseObject.HasKeyword(ArmorCuirass)
			if akBaseObject.HasKeyword(ArmorMaterialIron) || akBaseObject.HasKeyword(ArmorMaterialIronBanded)
				if (MainQuest as _Arissa_iNPC_Behavior).ArissaCommentedOn_Armor_Iron == false
					(MainQuest as _Arissa_iNPC_Behavior).CurrentArmorCommentIndex = 1
					_Arissa_Commentary_EquipmentReactions.Start()
					;debug.trace("[Arissa] I attempted to start the armor commentary quest.")
				endif
			elseif akBaseObject.HasKeyword(ArmorMaterialSteel)
				if (MainQuest as _Arissa_iNPC_Behavior).ArissaCommentedOn_Armor_Steel_1 == false
					(MainQuest as _Arissa_iNPC_Behavior).CurrentArmorCommentIndex = 2
					_Arissa_Commentary_EquipmentReactions.Start()
					;debug.trace("[Arissa] I attempted to start the armor commentary quest.")
				endif
			elseif akBaseObject.HasKeyword(ArmorMaterialSteelPlate)
				if (MainQuest as _Arissa_iNPC_Behavior).ArissaCommentedOn_Armor_Steel_2 == false
					(MainQuest as _Arissa_iNPC_Behavior).CurrentArmorCommentIndex = 3
					_Arissa_Commentary_EquipmentReactions.Start()
					;debug.trace("[Arissa] I attempted to start the armor commentary quest.")
				endif
			elseif akBaseObject.HasKeyword(ArmorMaterialImperialHeavy) || akBaseObject.HasKeyword(ArmorMaterialImperialLight) || akBaseObject.HasKeyword(ArmorMaterialImperialStudded) || akBaseObject.HasKeyword(ArmorMaterialPenitus)
				if (MainQuest as _Arissa_iNPC_Behavior).ArissaCommentedOn_Armor_Imperial == false
					(MainQuest as _Arissa_iNPC_Behavior).CurrentArmorCommentIndex = 12
					_Arissa_Commentary_EquipmentReactions.Start()
					;debug.trace("[Arissa] I attempted to start the armor commentary quest.")
				endif
			elseif akBaseObject.HasKeyword(ArmorMaterialLeather)
				if (MainQuest as _Arissa_iNPC_Behavior).ArissaCommentedOn_Armor_Leather == false
					(MainQuest as _Arissa_iNPC_Behavior).CurrentArmorCommentIndex = 8
					_Arissa_Commentary_EquipmentReactions.Start()
					;debug.trace("[Arissa] I attempted to start the armor commentary quest.")
				endif
			elseif akBaseObject.HasKeyword(ArmorMaterialScaled)
				if (MainQuest as _Arissa_iNPC_Behavior).ArissaCommentedOn_Armor_Scale == false
					(MainQuest as _Arissa_iNPC_Behavior).CurrentArmorCommentIndex = 11
					_Arissa_Commentary_EquipmentReactions.Start()
					;debug.trace("[Arissa] I attempted to start the armor commentary quest.")
				endif
			elseif akBaseObject.HasKeyword(ArmorMaterialStormcloak)
				if (MainQuest as _Arissa_iNPC_Behavior).ArissaCommentedOn_Armor_Stormcloak == false
					(MainQuest as _Arissa_iNPC_Behavior).CurrentArmorCommentIndex = 13
					_Arissa_Commentary_EquipmentReactions.Start()
					;debug.trace("[Arissa] I attempted to start the armor commentary quest.")
				endif
			elseif akBaseObject.HasKeyword(ArmorMaterialStudded) || akBaseObject.HasKeyword(ArmorMaterialHide)
				if (MainQuest as _Arissa_iNPC_Behavior).ArissaCommentedOn_Armor_Bandit_1 == false || (MainQuest as _Arissa_iNPC_Behavior).ArissaCommentedOn_Armor_Bandit_2 == false
					(MainQuest as _Arissa_iNPC_Behavior).CurrentArmorCommentIndex = 10
					_Arissa_Commentary_EquipmentReactions.Start()
					;debug.trace("[Arissa] I attempted to start the armor commentary quest.")
				endif
			elseif akBaseObject.HasKeyword(ArmorMaterialDwarven)
				if (MainQuest as _Arissa_iNPC_Behavior).ArissaCommentedOn_Armor_Dwarven == false
					(MainQuest as _Arissa_iNPC_Behavior).CurrentArmorCommentIndex = 4
					_Arissa_Commentary_EquipmentReactions.Start()
					;debug.trace("[Arissa] I attempted to start the armor commentary quest.")
				endif
			elseif akBaseObject.HasKeyword(ArmorMaterialOrcish)
				if (MainQuest as _Arissa_iNPC_Behavior).ArissaCommentedOn_Armor_Orcish == false
					(MainQuest as _Arissa_iNPC_Behavior).CurrentArmorCommentIndex = 5
					_Arissa_Commentary_EquipmentReactions.Start()
					;debug.trace("[Arissa] I attempted to start the armor commentary quest.")
				endif
			elseif akBaseObject.HasKeyword(ArmorMaterialEbony)
				if (MainQuest as _Arissa_iNPC_Behavior).ArissaCommentedOn_Armor_Ebony == false
					(MainQuest as _Arissa_iNPC_Behavior).CurrentArmorCommentIndex = 6
					_Arissa_Commentary_EquipmentReactions.Start()
					;debug.trace("[Arissa] I attempted to start the armor commentary quest.")
				endif
			elseif akBaseObject == ArmorDraugrCuirass
				if (MainQuest as _Arissa_iNPC_Behavior).ArissaCommentedOn_Armor_AncientNord == false
					(MainQuest as _Arissa_iNPC_Behavior).CurrentArmorCommentIndex = 14
					_Arissa_Commentary_EquipmentReactions.Start()
					;debug.trace("[Arissa] I attempted to start the armor commentary quest.")
				endif
			endif
		endif
	endif
endFunction



Event OnUpdate()
	UpdateTownRoamState()
	CheckRecovery()
	RegisterForSingleUpdate(3)
endEvent

Event OnUpdateGameTime()
	iNPCSystem.GaveLockpicksToday = false
	iNPCSystem.GavePoisonsToday = false

	;iNeed / Last Seed compatibility
	int apple_count = iNPCSystem.iNPC.GetActorRef().GetItemCount(FoodApple)
	int mead_count = iNPCSystem.iNPC.GetActorRef().GetItemCount(FoodMead)

	int apples_to_give = 5 - apple_count
	int mead_to_give = 4 - mead_count

	if apples_to_give > 0
		iNPCSystem.iNPC.GetActorRef().AddItem(FoodApple, apples_to_give)
	endif
	if mead_to_give > 0
		iNPCSystem.iNPC.GetActorRef().AddItem(FoodMead, mead_to_give)
	endif

	;Start MQ02 if not started yet
	if MQ02Counter <= 0
		if !_Arissa_MQ02.IsRunning() && !_Arissa_MQ02.IsCompleted()
			_Arissa_MQ02.Start()
		endif
	else
		if _Arissa_MQ01.IsCompleted()
			MQ02Counter -= 1
		endif
	endif

	RegisterForSingleUpdateGameTime(24)
endEvent

function UpdateTownRoamState()
	GetInTownRoamArea()
	if _Arissa_CurrentTownRoamArea.GetValueInt() > -1
		;do nothing
	else
		if iNPCSystem.IsTownRoaming
			iNPCSystem.StopTownRoam()
			_ArissaTownRoamEndMessage.Show()
			if _Arissa_HelpShown_TownRoam.GetValueInt() == 0
				_ArissaHelpTownRoam.Show()
				_Arissa_HelpShown_TownRoam.SetValueInt(1)
			endif
		endif
	endif
endFunction

function CheckRecovery()
	if RecoverArissa.GetValueInt() == 1
		RecoverArissa.SetValueInt(0)
		if iNPCSystem.iNPC.GetActorRef().IsDead()
			iNPCSystem.iNPC.GetActorRef().Resurrect()
		endif
		iNPCSystem.iNPC.GetActorRef().MoveTo(PlayerRef)
	endif
endFunction

function GetInTownRoamArea()
    if PlayerRef.IsInInterior()
        if PlayerRef.IsInLocation(WindhelmLocation)
            _Arissa_CurrentTownRoamArea.SetValueInt(0)
        elseif PlayerRef.IsInLocation(RiftenLocation)
            _Arissa_CurrentTownRoamArea.SetValueInt(1)
        elseif PlayerRef.IsInLocation(MarkarthLocation)
            _Arissa_CurrentTownRoamArea.SetValueInt(2)
        elseif PlayerRef.IsInLocation(WhiterunLocation)
            _Arissa_CurrentTownRoamArea.SetValueInt(3)
        elseif PlayerRef.IsInLocation(SolitudeLocation)
            _Arissa_CurrentTownRoamArea.SetValueInt(4)
        elseif PlayerRef.IsInLocation(DawnstarLocation)
            _Arissa_CurrentTownRoamArea.SetValueInt(5)
        elseif PlayerRef.IsInLocation(FalkreathLocation)
            _Arissa_CurrentTownRoamArea.SetValueInt(6)
        elseif PlayerRef.IsInLocation(MorthalLocation)
            _Arissa_CurrentTownRoamArea.SetValueInt(7)
        else
            _Arissa_CurrentTownRoamArea.SetValueInt(-1)
        endif
    else
        if PlayerRef.GetWorldspace() == WindhelmWorld || PlayerRef.GetDistance(WindhelmLocationCenterMarkerREF) < 8000.0
            _Arissa_CurrentTownRoamArea.SetValueInt(0)
        elseif PlayerRef.GetWorldspace() == RiftenWorld || PlayerRef.GetDistance(CenterMarkerRfiten) < 6000.0
            _Arissa_CurrentTownRoamArea.SetValueInt(1)
        elseif PlayerRef.GetWorldspace() == MarkarthWorld || PlayerRef.GetDistance(_Arissa_MarkarthCenterMarker) < 6000.0
            _Arissa_CurrentTownRoamArea.SetValueInt(2)
        elseif PlayerRef.GetWorldspace() == WhiterunWorld || PlayerRef.GetDistance(CenterMarkerWhiterun) < 5600.0
            _Arissa_CurrentTownRoamArea.SetValueInt(3)
        elseif PlayerRef.GetWorldspace() == SolitudeWorld || PlayerRef.GetDistance(SolitudeCenterMarker) < 11000.0
            _Arissa_CurrentTownRoamArea.SetValueInt(4)
        elseif PlayerRef.GetDistance(CenterMarkerDawnstar) < 8400.0
            _Arissa_CurrentTownRoamArea.SetValueInt(5)
        elseif PlayerRef.GetDistance(CenterMarkerFalkreath) < 4000.0
            _Arissa_CurrentTownRoamArea.SetValueInt(6)
        elseif PlayerRef.GetDistance(CenterMarkerMorthal) < 5500.0
            _Arissa_CurrentTownRoamArea.SetValueInt(7)
        else
            _Arissa_CurrentTownRoamArea.SetValueInt(-1)
        endif
    endif
endFunction