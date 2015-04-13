;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 16
Scriptname SF_dunMS06PotemasCorpseRoom_0009D5FB Extends Scene Hidden

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
SoulTrapPVFX02.Play(game.getPlayer(),5,mural)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
dunReanimateSelf.cast(draugrCorpse01,draugrCorpse01)
dunReanimateSelf.cast(draugrCorpse02,draugrCorpse02)
dunReanimateSelf.cast(draugrCorpse03,draugrCorpse03)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
QF_dunMS06_0001F142 QST = getOwningQuest() as QF_dunMS06_0001F142
objectReference MuralRef = QST.Alias_PotemaMural02.getReference()
(MuralRef.getLinkedRef()).activate(MuralRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DraugrCorpse01  Auto  

ObjectReference Property draugrCorpse02  Auto  

ObjectReference Property draugrCorpse03  Auto  

Spell Property dunReanimateSelf  Auto  

VisualEffect Property SoulTrapPVFX02  Auto  

ObjectReference Property Mural  Auto  
