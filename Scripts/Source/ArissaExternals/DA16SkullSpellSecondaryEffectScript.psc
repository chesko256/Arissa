Scriptname DA16SkullSpellSecondaryEffectScript extends ActiveMagicEffect  Conditional

DA16SHQuestScript Property pDA16SHQS Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

	pDA16SHQS.WakeSkullCount()

endEvent