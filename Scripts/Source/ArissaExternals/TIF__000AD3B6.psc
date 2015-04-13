;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000AD3B6 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
PerkInvestorAngelineGV.Value=0
(GetOwningQuest() as PerkInvestorQuestScript).GoldTransfer(AKSpeaker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property PerkInvestorUlfberthGV  Auto  

globalvariable Property PerkInvestorAngelineGV  Auto  
