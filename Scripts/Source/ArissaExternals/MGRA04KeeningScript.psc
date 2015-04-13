Scriptname MGRA04KeeningScript extends ReferenceAlias  

Quest Property MGRArniel04  Auto  


Event OnContainerChanged(ObjectReference NewContainer, ObjectReference OldContainer)

	if NewContainer == Game.GetPlayer()
		if GetOwningQuest().GetStage() == 20
			GetOwningQuest().SetStage(30)
		endif
	endif


EndEvent