Scriptname pArgonianAleScript extends ReferenceAlias  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

if WhiterunAleQuest.GetStage () == 10
	WhiterunAleQuest.SetStage (20)
endif


EndEvent

Quest Property WhiterunAleQuest  Auto  
