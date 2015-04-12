scriptname _Arissa_SkyUIConfigScript extends SKI_ConfigBase

float property DEFAULT_CHATTER_FREQUENCY = 3 autoReadOnly
float property DEFAULT_NEW_AREA_FREQUENCY = 0.5 autoReadOnly

GlobalVariable property _Arissa_Setting_AllowChatter auto
GlobalVariable property _Arissa_Setting_ChatterFrequency auto
GlobalVariable property _Arissa_Setting_AllowAnnounceNewArea auto
GlobalVariable property _Arissa_Setting_NewAreaFrequency auto

Quest property _Arissa_DialogueMain auto

int Behavior_SettingAllowChatter_OID
int Behavior_SettingChatterFrequency_OID
int Behavior_SettingAllowAnnounceNewArea_OID
int Behavior_SettingAnnounceAreaFrequency_OID
int Behavior_SettingRegardSystem_OID

Event OnConfigInit()
	Pages = new string[1]
	Pages[0] = "$ArissaBehaviorPage"
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

	SetCursorPosition(1) ; Move cursor to top right position

	AddHeaderOption("$ArissaDialogueRegardHeader")
	Behavior_SettingRegardSystem_OID = AddToggleOption("$ArissaRegardSystem", true)
endFunction

event OnPageReset(string page)
	;/if page == ""
		LoadCustomContent("arissa/logo.dds")
	else
		UnloadCustomContent()
	endif
	/;
	
	if page == "$ArissaBehaviorPage"
		PageReset_Behavior()
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