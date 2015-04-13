scriptName dunRobbersGorge_MoveSentryOnLoad extends ObjectReference

ObjectReference property SentryPoint1 Auto
ObjectReference property SentryPoint2 Auto
ObjectReference property Sentry Auto

Event OnCellLoad()
	if (Game.GetPlayer().GetDistance(SentryPoint1) < Game.GetPlayer().GetDistance(SentryPoint2))
		Sentry.MoveTo(SentryPoint1)
; 		;Debug.Trace("Moving Sentry to South.")
	Else
		Sentry.MoveTo(SentryPoint2)
; 		;Debug.Trace("Moving Sentry to North.")
	EndIf
EndEvent
