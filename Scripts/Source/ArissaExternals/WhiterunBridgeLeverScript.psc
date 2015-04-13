Scriptname WhiterunBridgeLeverScript  Extends ReferenceAlias

int Property StageToSetOnActivate Auto

Event onActivate(ObjectReference TriggerRef)

	if (GetOwningQuest() as CWSiegeScript).IsAttack()
		if GetOwningQuest().GetStageDone(StageToSetOnActivate) == False
			ObjectReference MyLink = self.GetReference().GetLinkedRef()
			GetOwningQuest().setStage(StageToSetOnActivate)
			self.GetReference().BlockActivation()
			MyLink.BlockActivation()
		EndIf
	elseif ((GetOwningQuest() as CWSiegeScript).IsAttack() == 0) && (TriggerRef != Game.GetPlayer())
		if GetOwningQuest().GetStageDone(StageToSetOnActivate) == False
			ObjectReference MyLink = self.GetReference().GetLinkedRef()
			GetOwningQuest().setStage(StageToSetOnActivate)
			self.GetReference().BlockActivation()
			MyLink.BlockActivation()
		EndIf
	else
		;do nothing
	endif

EndEvent
	