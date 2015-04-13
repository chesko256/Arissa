Scriptname CiceroJournalScript extends ReferenceAlias 


Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

if pDB07.GetStage () == 15
	pDB07.SetStage (19)
endif


EndEvent


;Event OnEquipped(Actor akActor)

 ;if akActor == Game.GetPlayer()
 ;endIf

;if pDB07.GetStage () == 17
	;pDB07.SetStage (19)
;endif

;EndEvent


Quest Property pDB07  Auto  
