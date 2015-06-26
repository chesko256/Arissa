scriptname _Arissa_LegacyConfigScript extends ActiveMagicEffect

Actor property PlayerRef auto
Spell property _Arissa_SummonSpell auto
GlobalVariable property _Arissa_Regard auto
GlobalVariable property _Arissa_Setting_AllowChatter auto
GlobalVariable property _Arissa_Setting_ChatterFrequency auto
GlobalVariable property _Arissa_Setting_AllowAnnounceNewArea auto
GlobalVariable property _Arissa_Setting_NewAreaFrequency auto
GlobalVariable property _Arissa_Setting_RegardSystem auto
GlobalVariable property RecoverArissa auto

Message property _Arissa_LegacyConfig_Root auto
Message property _Arissa_LegacyConfig_Dialogue auto
Message property _Arissa_LegacyConfig_Regard auto
Message property _Arissa_legacyconfig_chatter_on auto
Message property _Arissa_legacyconfig_chatter_off auto
Message property _Arissa_legacyconfig_chatterfreq auto
Message property _Arissa_legacyconfig_announcearea_on auto
Message property _Arissa_legacyconfig_announcearea_off auto
Message property _Arissa_legacyconfig_announceareafreq auto
Message property _Arissa_legacyconfig_regard_on auto
Message property _Arissa_legacyconfig_regard_off auto
Message property _Arissa_legacyconfig_regardinfo auto
Message property _Arissa_legacyconfig_regardinfo2 auto
Message property _Arissa_LegacyConfig_RegardOnConfirm auto
Message property _Arissa_LegacyConfig_RegardOffConfirm auto
Message property _Arissa_LegacyConfig_Recover auto
Message property _Arissa_LegacyConfig_RecoverConfirm auto


Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akCaster == Game.GetPlayer()
		menu_root()
	endif
EndEvent

;Root menu
function menu_root()
	int i = _Arissa_LegacyConfig_Root.Show()
	if i == 0
		menu_dialogue()
	elseif i == 1
		menu_regard()
    elseif i == 2
        menu_troubleshooting()
	elseif i == 3
		; Exit
	endif
endFunction

function menu_dialogue()
	int i = _Arissa_LegacyConfig_Dialogue.Show()
	if i == 0
		MenuHandler_Toggle(_Arissa_legacyconfig_chatter_on, _Arissa_legacyconfig_chatter_off, _Arissa_Setting_AllowChatter)
		menu_dialogue()
	elseif i == 1
		MenuHandler_UpDown(_Arissa_legacyconfig_chatterfreq, _Arissa_Setting_ChatterFrequency, 1, 24, 1)
		menu_dialogue()
	elseif i == 2
		MenuHandler_Toggle(_Arissa_legacyconfig_announcearea_on, _Arissa_legacyconfig_announcearea_off, _Arissa_Setting_AllowAnnounceNewArea)
		menu_dialogue()
	elseif i == 3
		MenuHandler_UpDownPct(_Arissa_legacyconfig_announceareafreq, _Arissa_Setting_NewAreaFrequency, 0.0, 1.0, 0.05)
		menu_dialogue()
	elseif i == 4
		menu_root()
	endif
endFunction

function menu_regard()
	int i = _Arissa_LegacyConfig_Regard.Show()
	if i == 0
		_Arissa_legacyconfig_regardinfo.Show()
		_Arissa_legacyconfig_regardinfo2.Show()
		menu_regard()
	elseif i == 1
		MenuHandler_ToggleConfirm(_Arissa_legacyconfig_regard_on, _Arissa_legacyconfig_regard_off, _Arissa_Setting_RegardSystem, _Arissa_LegacyConfig_RegardOnConfirm, _Arissa_LegacyConfig_RegardOffConfirm)
		menu_regard()
	elseif i == 2
		menu_root()
	endif
endFunction

function menu_troubleshooting()
    int i = _Arissa_LegacyConfig_Recover.Show()
    if i == 0
        RecoverArissa.SetValueInt(1)
        _Arissa_LegacyConfig_RecoverConfirm.Show()
    else
        menu_root()
    endif
endFunction

;Format: On/Off, Back
;akSetting: 2 = ON, 1 = OFF
function MenuHandler_Toggle(Message akMessageOn, Message akMessageOff, GlobalVariable akSetting)
    if akSetting.GetValueInt() == 2
        int i = akMessageOn.Show()
        if i == 0
            akSetting.SetValueInt(1)
            MenuHandler_Toggle(akMessageOn, akMessageOff, akSetting)
        elseif i == 1
            ;return
        endif
    elseif akSetting.GetValueInt() == 1
        int i = akMessageOff.Show()
        if i == 0
            akSetting.SetValueInt(2)
            MenuHandler_Toggle(akMessageOn, akMessageOff, akSetting)
        elseif i == 1
            ;return
        endif
    endif
endFunction

;Format: On/Off, Back
;akSetting: 2 = ON, 1 = OFF
function MenuHandler_ToggleConfirm(Message akMessageOn, Message akMessageOff, GlobalVariable akSetting, Message akConfirmIfOn, Message akConfirmIfOff)
    if akSetting.GetValueInt() == 2
        int i = akMessageOn.Show()
        if i == 0
        	int j = akConfirmIfOn.Show()
        	if j == 0
            	akSetting.SetValueInt(1)
            	MenuHandler_ToggleConfirm(akMessageOn, akMessageOff, akSetting, akConfirmIfOn, akConfirmIfOff)
            	_Arissa_Regard.SetValue(10.0)
				if !PlayerRef.HasSpell(_Arissa_SummonSpell)
					PlayerRef.AddSpell(_Arissa_SummonSpell)
				endif
            else
            	;return
            endif
        elseif i == 1
            ;return
        endif
    elseif akSetting.GetValueInt() == 1
        int i = akMessageOff.Show()
        if i == 0
        	int j = akConfirmIfOff.Show()
        	if j == 0
            	akSetting.SetValueInt(2)
            	MenuHandler_ToggleConfirm(akMessageOn, akMessageOff, akSetting, akConfirmIfOn, akConfirmIfOff)
            	_Arissa_Regard.SetValue(-6.0)
				if PlayerRef.HasSpell(_Arissa_SummonSpell)
					PlayerRef.RemoveSpell(_Arissa_SummonSpell)
				endif
            else
            	;return
            endif
        elseif i == 1
            ;return
        endif
    endif
endFunction

;Format: Down, Up, Back
function MenuHandler_UpDown(Message akMessage, GlobalVariable akSetting, float afMin, float afMax, float afStepSize)
    int i = akMessage.Show(akSetting.GetValue())
    if i == 0
        ;Down
        if akSetting.GetValue() > afMin
            akSetting.SetValue(akSetting.GetValue() - afStepSize)
            if akSetting.GetValue() < afMin
                akSetting.SetValue(afMin)
            endif
            MenuHandler_UpDown(akMessage, akSetting, afMin, afMax, afStepSize)
        else
            MenuHandler_UpDown(akMessage, akSetting, afMin, afMax, afStepSize)
        endif
    elseif i == 1
        ;Up
        if akSetting.GetValue() < afMax
            akSetting.SetValue(akSetting.GetValue() + afStepSize)
            if akSetting.GetValue() > afMax
                akSetting.SetValue(afMax)
            endif
            MenuHandler_UpDown(akMessage, akSetting, afMin, afMax, afStepSize)
        else
            MenuHandler_UpDown(akMessage, akSetting, afMin, afMax, afStepSize)
        endif
    else
        ;return
    endif
endFunction

;Format: Down, Up, Back
function MenuHandler_UpDownPct(Message akMessage, GlobalVariable akSetting, float afMin, float afMax, float afStepSize)
    int i = akMessage.Show(akSetting.GetValue() * 100)
    if i == 0
        ;Down
        if akSetting.GetValue() > afMin
            akSetting.SetValue(akSetting.GetValue() - afStepSize)
            if akSetting.GetValue() < afMin
                akSetting.SetValue(afMin)
            endif
            MenuHandler_UpDownPct(akMessage, akSetting, afMin, afMax, afStepSize)
        else
            MenuHandler_UpDownPct(akMessage, akSetting, afMin, afMax, afStepSize)
        endif
    elseif i == 1
        ;Up
        if akSetting.GetValue() < afMax
            akSetting.SetValue(akSetting.GetValue() + afStepSize)
            if akSetting.GetValue() > afMax
                akSetting.SetValue(afMax)
            endif
            MenuHandler_UpDownPct(akMessage, akSetting, afMin, afMax, afStepSize)
        else
            MenuHandler_UpDownPct(akMessage, akSetting, afMin, afMax, afStepSize)
        endif
    else
        ;return
    endif
endFunction