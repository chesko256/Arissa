scriptname _Arissa_SkyUIConfigScript extends SKI_ConfigBase

float property DEFAULT_CHATTER_FREQUENCY = 0.1 autoReadOnly

GlobalVariable property _Arissa_Setting_ChatterFrequency auto

int Behavior_SettingChatterFrequency_OID

Event OnConfigInit()
	Pages = new string[3]
	Pages[0] = "$ArissaBehaviorPage"
endEvent

function PageReset_Behavior()
	SetCursorFillMode(TOP_TO_BOTTOM)

	AddHeaderOption("$ArissaDialogueBehaviorHeader")
	
	Behavior_SettingChatterFrequency_OID = AddSliderOption("$ArissaChatterFrequency", (_Arissa_Setting_ChatterFrequency.GetValue() * 100), "{0}%")
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
	endif
endEvent

event OnOptionDefault(int option)
	if option == Behavior_SettingChatterFrequency_OID
		_Arissa_Setting_ChatterFrequency.SetValue(DEFAULT_CHATTER_FREQUENCY)
		SetSliderOptionValue(Behavior_SettingChatterFrequency_OID, DEFAULT_CHATTER_FREQUENCY, "{0}%")
	endif
endEvent

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