;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00039830 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
MG08QuestScript MG08Script = MG08 as MG08QuestScript
MG08Script.MG08TandilFree = 2
MG08TandilAlias.GetReference().Enable()
MG08GelebrosAlias.GetReference().Enable()
MG08TandilAlias.GetActorReference().SetAlpha(0)
MG08GelebrosAlias.GetActorReference().SetAlpha(0)
While MG08TandilAlias.GetReference().Is3DLoaded() == False
Utility.Wait(0.1)
endwhile
MGTeleportInEffect.Play(MG08TandilAlias.GetReference(), 3.6)
MGTeleportInEffect.Play(MG08GelebrosAlias.GetReference(), 3.6)
MG08TandilAlias.GetActorReference().SetAlpha(1, true)
MG08GelebrosAlias.GetActorReference().SetAlpha(1, true)

MG08MonkScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property MG08TandilAlias  Auto  

ReferenceAlias Property MG08GelebrosAlias  Auto  

ReferenceAlias Property MG08IsabelleAlias  Auto  

Quest Property MG08  Auto  

Scene Property MG08MonkScene  Auto  

VisualEffect Property MGTeleportInEffect  Auto  
