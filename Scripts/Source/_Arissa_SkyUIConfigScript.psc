scriptname _Arissa_SkyUIConfigScript extends SKI_ConfigBase

float property DEFAULT_CHATTER_FREQUENCY = 0.1 autoReadOnly

GlobalVariable property _Arissa_Setting_ChatterFrequency auto
GlobalVariable property _Arissa_Setting_AlwaysAnnounceNewArea auto

int Behavior_SettingChatterFrequency_OID
int Behavior_SettingAlwaysAnnounceNewArea_OID

Event OnConfigInit()
	Pages = new string[1]
	Pages[0] = "$ArissaBehaviorPage"
endEvent

function PageReset_Behavior()
	SetCursorFillMode(TOP_TO_BOTTOM)

	AddHeaderOption("$ArissaDialogueBehaviorHeader")
	
	Behavior_SettingChatterFrequency_OID = AddSliderOption("$ArissaChatterFrequency", (_Arissa_Setting_ChatterFrequency.GetValue() * 100), "{0}%")
	if _Arissa_Setting_AlwaysAnnounceNewArea.GetValueInt() == 2
		Behavior_SettingAlwaysAnnounceNewArea_OID = AddToggleOption("$ArissaAlwaysAnnounceNewArea", true)
	else
		Behavior_SettingAlwaysAnnounceNewArea_OID = AddToggleOption("$ArissaAlwaysAnnounceNewArea", false)
	endif
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
	if option == Behavior_SettingChatterFrequency_OID
		SetInfoText("$ArissaOptionHighlightSettingChatterFrequency")
	elseif option == Behavior_SettingAlwaysAnnounceNewArea_OID
		SetInfoText("$ArissaOptionHighlightSettingAlwaysAnnounceNewArea")
	endif
endEvent

event OnOptionDefault(int option)
	if option == Behavior_SettingChatterFrequency_OID
		_Arissa_Setting_ChatterFrequency.SetValue(DEFAULT_CHATTER_FREQUENCY)
		SetSliderOptionValue(Behavior_SettingChatterFrequency_OID, DEFAULT_CHATTER_FREQUENCY, "{0}%")
	elseif option == Behavior_SettingAlwaysAnnounceNewArea_OID
		_Arissa_Setting_AlwaysAnnounceNewArea.SetValue(2)
		SetToggleOptionValue(Behavior_SettingAlwaysAnnounceNewArea_OID, true)
	endif
endEvent

Event OnOptionSelect(int option)
	if option == Behavior_SettingAlwaysAnnounceNewArea_OID
		if _Arissa_Setting_AlwaysAnnounceNewArea.GetValueInt() == 2
			_Arissa_Setting_AlwaysAnnounceNewArea.SetValue(1)
			SetToggleOptionValue(Behavior_SettingAlwaysAnnounceNewArea_OID, false)
		else
			_Arissa_Setting_AlwaysAnnounceNewArea.SetValue(2)
			SetToggleOptionValue(Behavior_SettingAlwaysAnnounceNewArea_OID, true)
		endif
	endif
EndEvent

event OnOptionSliderOpen(int option)
	if option == Behavior_SettingChatterFrequency_OID
		SetSliderDialogStartValue((_Arissa_Setting_ChatterFrequency.GetValue() * 100))
		SetSliderDialogDefaultValue(DEFAULT_CHATTER_FREQUENCY * 100)
		SetSliderDialogRange(1, 100)
		SetSliderDialogInterval(1.0)
	endif
endEvent

event OnOptionSliderAccept(int option, float value)
	if option == Behavior_SettingChatterFrequency_OID
		_Arissa_Setting_ChatterFrequency.SetValue(value / 100)
		SetSliderOptionValue(Behavior_SettingChatterFrequency_OID, value, "{0}%")
	endif
endEvent