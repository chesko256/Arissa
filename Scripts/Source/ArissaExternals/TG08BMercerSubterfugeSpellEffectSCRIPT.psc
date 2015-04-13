scriptName TG08BMercerSubterfugeSpellEffectSCRIPT extends ActiveMagicEffect
{Scripted effect for the using Image Space Mods on Magic Effects}



;======================================================================================;
;  PROPERTIES  /
;=============/

Quest property TG08B auto

EffectShader property IllusionNegativeFXS auto

TG08BQuestScript property myQuestScript auto

ActorBase property Brynjolf auto

;======================================================================================;
;   EVENTS     /
;=============/


Event OnEffectStart(Actor Target, Actor Caster)
	myQuestScript = TG08B as TG08BQuestScript
	
	if Target.getActorBase() == Brynjolf
		myQuestScript.pTG08BBrynjolfIsCharmed = true
		IllusionNegativeFXS.Play(Target)
	endif
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	myQuestScript = TG08B as TG08BQuestScript
	
	if Target.getActorBase() == Brynjolf
		myQuestScript.pTG08BBrynjolfIsCharmed = false
		IllusionNegativeFXS.Stop(Target)
	endif
endEvent
