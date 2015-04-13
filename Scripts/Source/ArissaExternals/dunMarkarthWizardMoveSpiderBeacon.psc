Scriptname dunMarkarthWizardMoveSpiderBeacon extends ObjectReference

ReferenceAlias property TG06_WQ_SpiderBeacon Auto
ReferenceAlias property Spider Auto
Quest property MWQQuest Auto
Message property FailMessage Auto
Location property WQ02Location Auto

Event OnInit()
	if (Game.GetPlayer().IsInLocation(WQ02Location))
		Spider.GetActorReference().EvaluatePackage()
		TG06_WQ_SpiderBeacon.GetReference().MoveTo(Self)
		Spider.GetActorRef().EvaluatePackage()
	Else
		FailMessage.Show()
	EndIf
	Self.Disable()
	Self.Delete()
EndEvent