ScriptName dunMarkarthWizardSpiderStaffEffect extends ActiveMagicEffect
{Force-evals the spider's packages, or displays the failure message.}

Quest property MWQQuest Auto
Message property FailMessage Auto
ReferenceAlias property Spider Auto
Location property WQ02Location Auto

Event OnEffectStart(Actor Target, Actor Caster)
	if (Game.GetPlayer().IsInLocation(WQ02Location))
		MWQQuest.SetStage(7)
		Spider.GetActorReference().EvaluatePackage()
	Else
		FailMessage.Show()
	EndIf
EndEvent