;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_MS11Kicker_000BAC24 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
EnterWindhelmCount.SetValueInt(EnterWindhelmCount.GetValueInt() + 1)

Debug.Trace("MS11: Counting entrance to Windhelm -- " + EnterWindhelmCount.GetValueInt())

if ((EnterWindhelmCount.GetValueInt() >= 4))
	if (  (GameHour.GetValueInt() >= 19) || (GameHour.GetValueInt() < 7)  )
 		Debug.Trace("MS11: Kicking quest start on Windhelm entrance #" + EnterWindhelmCount.GetValueInt())
		MS11.Start()
	endif
endif

if (MS11.GetStageDone(100) && !MS11.GetStageDone(105))
	if (GameDaysPassed.Value > FollowupStartDay.Value)
		MS11.SetStage(105)
	endif
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property EnterWindhelmCount  Auto  

GlobalVariable Property FollowupStartDay  Auto  

Quest Property MS11  Auto  

GlobalVariable Property GameHour  Auto  

GlobalVariable Property GameDaysPassed  Auto  
