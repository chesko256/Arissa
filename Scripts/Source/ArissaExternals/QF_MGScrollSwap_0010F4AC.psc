;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_MGScrollSwap_0010F4AC Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
CollegeElderScrollRef.Enable()
(DialogueWinterholdCollege as DialogueWinterholdCollegeQuestScript).ScrollDonated = -1
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property CollegeElderScrollRef  Auto  

Quest Property DialogueWinterholdCollege  Auto  
