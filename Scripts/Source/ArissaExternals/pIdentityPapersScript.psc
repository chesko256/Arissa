Scriptname pIdentityPapersScript extends ReferenceAlias  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
pDB08Script Script = pDB08 as pDB08Script
if pDB08.GetStage () == 20
	pDB08.SetStage (30)
	Script.pHasPapers=1
endif


EndEvent


Quest Property pDB08  Auto  
