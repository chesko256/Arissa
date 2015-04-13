Scriptname MGRShellScript extends Quest Conditional

keyword Property MGRTolfdir auto
keyword Property MGRDrevis auto
keyword Property MGRSergius auto
keyword Property MGRUrag auto

function StartTolfdirQuest()
; 	Debug.Trace("MGRShell Function Running")
	MGRTolfdir.SendStoryEvent()
EndFunction


function StartDrevisQuest()
	MGRDrevis.SendStoryEvent()
EndFunction


function StartSergiusQuest()
	MGRSergius.SendStoryEvent()
EndFunction

function StartUragQuest()
	MGRUrag.SendStoryEvent()
EndFunction


Bool Property pMGR01Done  Auto Conditional
Bool Property pMGR02Done  Auto Conditional
Bool Property pMGR10Done  Auto Conditional
Bool Property pMGR11Done  Auto Conditional
Bool Property pMGR12Done  Auto Conditional
Bool Property pMGR20Done  Auto Conditional

int Property MGRTolfdirDay  Auto Conditional
int Property MGRDrevisDay  Auto Conditional
int Property MGRSergiusDay  Auto Conditional
int Property MGRUragDay  Auto Conditional