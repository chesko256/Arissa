Scriptname MG02AmuletTriggerScript extends ReferenceAlias  

ObjectReference Property SpikeTrigger  Auto  

ReferenceAlias Property MG02WallAlias  Auto
Quest Property MG02  Auto


bool DoOnce = False




Event OnActivate(objectreference Actionref)

	if ActionRef == Game.GetPlayer()
		If DoOnce == False
			DoOnce = True
			MG02WallAlias.GetReference().PlayAnimation("Take")
			Game.GetPlayer().AddItem(MG02AmuletAlias.GetReference(), 1)
			MG02TrapCollision01Ref.Enable()
			SpikeTrigger.Activate(Game.GetPlayer())
			MG02.SetStage(40)
	
			if MG02.IsObjectiveDisplayed(30)
			(MG02 as MG02QuestScript).VCount()
			endif

			Self.GetReference().Disable()
		endif
	endif



EndEvent
Armor Property MG02Amulet  Auto  

ReferenceAlias Property MG02AmuletAlias  Auto  

ObjectReference Property MG02TrapCollision01Ref  Auto  
