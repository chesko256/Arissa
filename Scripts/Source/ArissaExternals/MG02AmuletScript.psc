scriptName MG02AmuletScript extends ObjectReference

Quest Property pMG02QuestScript auto
Message Property pMG02TestWallMessage auto
ReferenceAlias Property MG02WallAlias  Auto  
Scene Property MG02TolfdirAmuletScene  Auto
int DoOnce

Event OnEquipped(Actor AkActor)

		MG02QuestScript QuestScript = pMG02QuestScript as MG02QuestScript

	if DoOnce == 0
		MG02TolfdirAmuletScene.Start()
		DoOnce=1



	endif		
	if QuestScript.TolfdirUpdate == 0
		MG02AmuletResonanceRef.PlayAnimation("PlayAnim02")
	endif
EndEvent



Event OnUnequipped(Actor AkActor)

	MG02AmuletResonanceRef.PlayAnimation("PlayAnim01")

EndEvent



Spell Property AmuletSpell  Auto  

 

ObjectReference Property MG02AmuletResonanceRef  Auto  
