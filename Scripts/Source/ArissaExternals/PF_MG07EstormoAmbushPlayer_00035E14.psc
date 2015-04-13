;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname PF_MG07EstormoAmbushPlayer_00035E14 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
MG07EstormoAlias.GetActorReference().EquipSpell(LightningBolt, 0)
MG07EstormoAlias.GetActorReference().EquipSpell(LightningBolt,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

referencealias Property MG07EstormoAlias  Auto  

Spell Property LightningBolt  Auto  
