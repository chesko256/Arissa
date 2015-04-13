Scriptname MQ202ShavariTriggerScript extends DefaultOnEnter  Conditional

function TriggerMe()
	; evp Shavari
	(ShavariRef as Actor).EvaluatePackage()
	parent.TriggerMe()
endFunction


ObjectReference Property ShavariRef  Auto  
