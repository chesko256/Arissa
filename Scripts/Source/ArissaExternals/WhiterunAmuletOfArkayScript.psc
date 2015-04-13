Scriptname WhiterunAmuletOfArkayScript extends ReferenceAlias  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

if WhiterunAmuletQuest.GetStage () == 10
	WhiterunAmuletQuest.SetStage (20)
endif


EndEvent

Quest Property WhiterunAmuletQuest  Auto  
