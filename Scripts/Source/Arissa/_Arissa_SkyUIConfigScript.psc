scriptname _Arissa_SkyUIConfigScript extends SKI_ConfigBase

float property DEFAULT_CHATTER_FREQUENCY = 3 autoReadOnly
float property DEFAULT_NEW_AREA_FREQUENCY = 0.5 autoReadOnly

GlobalVariable property _Arissa_Setting_AllowChatter auto
GlobalVariable property _Arissa_Setting_ChatterFrequency auto
GlobalVariable property _Arissa_Setting_AllowAnnounceNewArea auto
GlobalVariable property _Arissa_Setting_NewAreaFrequency auto
GlobalVariable property _Arissa_Regard auto
GlobalVariable property _Arissa_Setting_RegardSystem auto
GlobalVariable property RecoverArissa auto

Actor property iNPC_Actor auto
Actor property PlayerRef auto
Quest property _Arissa_DialogueMain auto
Spell property _Arissa_SummonSpell auto

int Behavior_SettingAllowChatter_OID
int Behavior_SettingChatterFrequency_OID
int Behavior_SettingAllowAnnounceNewArea_OID
int Behavior_SettingAnnounceAreaFrequency_OID
int Behavior_AboutRegard_OID
int Behavior_SettingRegardSystem_OID
int Behavior_RecoverArissa_OID

Event OnConfigInit()
	Pages = new string[2]
	Pages[0] = "$ArissaBehaviorPage"
	Pages[1] = "$ArissaStatsPage"
endEvent

function PageReset_Behavior()
	SetCursorFillMode(TOP_TO_BOTTOM)

	AddHeaderOption("$ArissaDialogueChatterHeader")
	if _Arissa_Setting_AllowChatter.GetValueInt() == 2
		Behavior_SettingAllowChatter_OID = AddToggleOption("$ArissaAllowChatter", true)
	else
		Behavior_SettingAllowChatter_OID = AddToggleOption("$ArissaAllowChatter", false)
	endif
	if _Arissa_Setting_AllowChatter.GetValueInt() == 2
		Behavior_SettingChatterFrequency_OID = AddSliderOption("$ArissaChatterFrequency", (_Arissa_Setting_ChatterFrequency.GetValue()), "Every {0} Hour(s)")
	else
		Behavior_SettingChatterFrequency_OID = AddSliderOption("$ArissaChatterFrequency", (_Arissa_Setting_ChatterFrequency.GetValue()), "Every {0} Hour(s)", OPTION_FLAG_DISABLED)
	endif
	
	AddEmptyOption()

	if _Arissa_Setting_AllowAnnounceNewArea.GetValueInt() == 2
		Behavior_SettingAllowAnnounceNewArea_OID = AddToggleOption("$ArissaAnnounceNewArea", true)
	else
		Behavior_SettingAllowAnnounceNewArea_OID = AddToggleOption("$ArissaAnnounceNewArea", false)
	endif
	if _Arissa_Setting_AllowAnnounceNewArea.GetValueInt() == 2
		Behavior_SettingAnnounceAreaFrequency_OID = AddSliderOption("$ArissaAnnounceAreaFrequency", (_Arissa_Setting_NewAreaFrequency.GetValue() * 100), "{0}%")
	else
		Behavior_SettingAnnounceAreaFrequency_OID = AddSliderOption("$ArissaAnnounceAreaFrequency", (_Arissa_Setting_NewAreaFrequency.GetValue() * 100), "{0}%", OPTION_FLAG_DISABLED)
	endif
	
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()

	AddHeaderOption("$ArissaDialogueTroubleshootingHeader")
	Behavior_RecoverArissa_OID = AddTextOption("$ArissaRecover", "$ArissaRecoverClick")

	SetCursorPosition(1) ; Move cursor to top right position

	AddHeaderOption("$ArissaDialogueRegardHeader")
	Behavior_AboutRegard_OID = AddTextOption("$ArissaAboutRegard", "")
	if _Arissa_Setting_RegardSystem.GetValueInt() == 2
		Behavior_SettingRegardSystem_OID = AddToggleOption("$ArissaRegardSystem", true)
	else
		Behavior_SettingRegardSystem_OID = AddToggleOption("$ArissaRegardSystem", false)
	endif
	if _Arissa_Regard.GetValue() > 8.0
		AddTextOption("$ArissaCurrentRegard", "$ArissaRegard5", OPTION_FLAG_DISABLED)
	elseif _Arissa_Regard.GetValue() > 5.0
		AddTextOption("$ArissaCurrentRegard", "$ArissaRegard4", OPTION_FLAG_DISABLED)
	elseif _Arissa_Regard.GetValue() > 0.0
		AddTextOption("$ArissaCurrentRegard", "$ArissaRegard3", OPTION_FLAG_DISABLED)
	elseif _Arissa_Regard.GetValue() > -5.0
		AddTextOption("$ArissaCurrentRegard", "$ArissaRegard2", OPTION_FLAG_DISABLED)
	elseif _Arissa_Regard.GetValue() > -8.0
		AddTextOption("$ArissaCurrentRegard", "$ArissaRegard1", OPTION_FLAG_DISABLED)
	elseif _Arissa_Regard.GetValue() <= -8.0
		AddTextOption("$ArissaCurrentRegard", "$ArissaRegard0", OPTION_FLAG_DISABLED)
	endif
endFunction

function PageReset_Stats()
	SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("$ArissaAttributesHeader")
	AddTextOption("$ArissaHealth", (iNPC_Actor.GetActorValue("Health") as int))
	AddTextOption("$ArissaStamina", (iNPC_Actor.GetActorValue("Stamina") as int))
	AddHeaderOption("$ArissaSkillsHeader")
	AddTextOption("$ArissaOneHanded", iNPC_Actor.GetActorValue("OneHanded") as int)
	AddTextOption("$ArissaTwoHanded", iNPC_Actor.GetActorValue("TwoHanded") as int)
	AddTextOption("$ArissaMarksman", iNPC_Actor.GetActorValue("Marksman") as int)
	AddTextOption("$ArissaBlock", iNPC_Actor.GetActorValue("Block") as int)
	AddTextOption("$ArissaHeavyArmor", iNPC_Actor.GetActorValue("HeavyArmor") as int)
	AddTextOption("$ArissaLightArmor", iNPC_Actor.GetActorValue("LightArmor") as int)
	AddTextOption("$ArissaPickpocket", iNPC_Actor.GetActorValue("Pickpocket") as int)
	AddTextOption("$ArissaLockpicking", iNPC_Actor.GetActorValue("Lockpicking") as int)
	
	SetCursorPosition(1) ; Move cursor to top right position

	AddEmptyOption()
	AddTextOption("$ArissaMagicka", (iNPC_Actor.GetActorValue("Magicka") as int))
	Cell mycell = iNPC_Actor.GetParentCell()
	
	string lname
	if mycell
		lname = mycell.GetName()
	endif
	if lname == ""
		Location loc = iNPC_Actor.GetCurrentLocation()
		if loc
			lname = loc.GetName()
		else
			lname = "Unknown"
		endif
	endif
	AddTextOption("$ArissaCurrentLocation", lname)
	AddEmptyOption()
	AddTextOption("$ArissaSneak", iNPC_Actor.GetActorValue("Sneak") as int)
	AddTextOption("$ArissaSpeechcraft", iNPC_Actor.GetActorValue("Speechcraft") as int)
	AddTextOption("$ArissaAlteration", iNPC_Actor.GetActorValue("Alteration") as int)
	AddTextOption("$ArissaConjuration", iNPC_Actor.GetActorValue("Conjuration") as int)
	AddTextOption("$ArissaDestruction", iNPC_Actor.GetActorValue("Destruction") as int)
	AddTextOption("$ArissaIllusion", iNPC_Actor.GetActorValue("Illusion") as int)
	AddTextOption("$ArissaRestoration", iNPC_Actor.GetActorValue("Restoration") as int)
endFunction

event OnPageReset(string page)
	if page == ""
		LoadCustomContent("arissa/logo.dds")
	else
		UnloadCustomContent()
	endif
	
	if page == "$ArissaBehaviorPage"
		PageReset_Behavior()
	elseif page == "$ArissaStatsPage"
		PageReset_Stats()
	endif
endEvent

event OnOptionHighlight(int option)
	if option == Behavior_SettingAllowChatter_OID
		SetInfoText("$ArissaOptionHighlightSettingAllowChatter")
	elseif option == Behavior_SettingChatterFrequency_OID
		SetInfoText("$ArissaOptionHighlightSettingChatterFrequency")
	elseif option == Behavior_SettingAllowAnnounceNewArea_OID
		SetInfoText("$ArissaOptionHighlightSettingAnnounceNewArea")
	elseif option == Behavior_SettingAnnounceAreaFrequency_OID
		SetInfoText("$ArissaOptionHighlightSettingAnnounceAreaFrequency")
	elseif option == Behavior_SettingRegardSystem_OID
		SetInfoText("$ArissaOptionHighlightSettingRegardSystem")
	elseif option == Behavior_RecoverArissa_OID
		SetInfoText("$ArissaOptionHighlightRecovery")
	endif
endEvent

event OnOptionDefault(int option)
	if option == Behavior_SettingAllowChatter_OID
		_Arissa_Setting_AllowChatter.SetValue(2)
		SetToggleOptionValue(Behavior_SettingAllowChatter_OID, true)
	elseif option == Behavior_SettingChatterFrequency_OID
		_Arissa_Setting_ChatterFrequency.SetValue(DEFAULT_CHATTER_FREQUENCY)
		SetSliderOptionValue(Behavior_SettingChatterFrequency_OID, DEFAULT_CHATTER_FREQUENCY, "Every {0} Hour(s)")
	elseif option == Behavior_SettingAllowAnnounceNewArea_OID
		_Arissa_Setting_AllowAnnounceNewArea.SetValue(2)
		SetToggleOptionValue(Behavior_SettingAllowAnnounceNewArea_OID, true)
	elseif option == Behavior_SettingAnnounceAreaFrequency_OID
		_Arissa_Setting_NewAreaFrequency.SetValue(0.5)
		SetSliderOptionValue(Behavior_SettingAnnounceAreaFrequency_OID, DEFAULT_NEW_AREA_FREQUENCY, "{0}%")
	endif 
endEvent

Event OnOptionSelect(int option)
	if option == Behavior_SettingAllowChatter_OID
		if _Arissa_Setting_AllowChatter.GetValueInt() == 2
			_Arissa_Setting_AllowChatter.SetValue(1)
			SetToggleOptionValue(Behavior_SettingAllowChatter_OID, false)
			(_Arissa_DialogueMain as _Arissa_iNPC_Behavior).SetAllowChatter()
			ForcePageReset()
		else
			_Arissa_Setting_AllowChatter.SetValue(2)
			SetToggleOptionValue(Behavior_SettingAllowChatter_OID, true)
			(_Arissa_DialogueMain as _Arissa_iNPC_Behavior).SetAllowChatter()
			ForcePageReset()
		endif
	elseif option == Behavior_SettingAllowAnnounceNewArea_OID
		if _Arissa_Setting_AllowAnnounceNewArea.GetValueInt() == 2
			_Arissa_Setting_AllowAnnounceNewArea.SetValue(1)
			SetToggleOptionValue(Behavior_SettingAllowAnnounceNewArea_OID, false)
			ForcePageReset()
		else
			_Arissa_Setting_AllowAnnounceNewArea.SetValue(2)
			SetToggleOptionValue(Behavior_SettingAllowAnnounceNewArea_OID, true)
			ForcePageReset()
		endif
	elseif option == Behavior_SettingRegardSystem_OID
		if _Arissa_Setting_RegardSystem.GetValueInt() == 2
			bool b = ShowMessage("$ArissaMessageRegardSystemOn")
			if b
				_Arissa_Setting_RegardSystem.SetValue(1)
				SetToggleOptionValue(Behavior_SettingRegardSystem_OID, false)
				(_Arissa_DialogueMain as _Arissa_iNPC_Main).SlamToRegarded()
				if !PlayerRef.HasSpell(_Arissa_SummonSpell)
					PlayerRef.AddSpell(_Arissa_SummonSpell)
				endif
			endif
			ForcePageReset()
		else
			bool b = ShowMessage("$ArissaMessageRegardSystemOff")
			if b
				_Arissa_Setting_RegardSystem.SetValue(2)
				SetToggleOptionValue(Behavior_SettingRegardSystem_OID, true)
				float delta = -6.0 - _Arissa_Regard.GetValue()
				(_Arissa_DialogueMain as _Arissa_iNPC_Main).ModAssessment(delta)
				if PlayerRef.HasSpell(_Arissa_SummonSpell)
					PlayerRef.RemoveSpell(_Arissa_SummonSpell)
				endif
			endif
			ForcePageReset()
		endif 
	elseif option == Behavior_AboutRegard_OID
		ShowMessage("$ArissaMessageAboutRegard", false)
		ShowMessage("$ArissaMessageAboutRegard2", false)
	elseif option == Behavior_RecoverArissa_OID
		bool b = ShowMessage("$ArissaMessageRecoverConfirm")
		if b
			RecoverArissa.SetValueInt(1)
			ShowMessage("$ArissaMessageRecoverComplete", false)
		endif
	endif
EndEvent

event OnOptionSliderOpen(int option)
	if option == Behavior_SettingChatterFrequency_OID
		SetSliderDialogStartValue(_Arissa_Setting_ChatterFrequency.GetValueInt())
		SetSliderDialogDefaultValue(DEFAULT_CHATTER_FREQUENCY)
		SetSliderDialogRange(1, 24)
		SetSliderDialogInterval(1.0)
	elseif option == Behavior_SettingAnnounceAreaFrequency_OID
		SetSliderDialogStartValue(_Arissa_Setting_NewAreaFrequency.GetValue() * 100)
		SetSliderDialogDefaultValue(DEFAULT_NEW_AREA_FREQUENCY * 100)
		SetSliderDialogRange(1, 100)
		SetSliderDialogInterval(1.0)
	endif
endEvent

event OnOptionSliderAccept(int option, float value)
	if option == Behavior_SettingChatterFrequency_OID
		_Arissa_Setting_ChatterFrequency.SetValue(value)
		SetSliderOptionValue(Behavior_SettingChatterFrequency_OID, value, "Every {0} Hour(s)")
	elseif option == Behavior_SettingAnnounceAreaFrequency_OID
		_Arissa_Setting_NewAreaFrequency.SetValue(value / 100)
		SetSliderOptionValue(Behavior_SettingAnnounceAreaFrequency_OID, value, "{0}%")
	endif
endEvent