;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname SF_dunMS06PotemaMuralIntro_00096D8C Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
QF_dunMS06_0001F142 QST = getOwningQuest() as QF_dunMS06_0001F142
objectReference Mural = QST.alias_PotemaMural.getReference()
TrailFX.Play(game.getPlayer(),5,muralEye)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; test
GateRef.activate(gateRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;visualEffect property trailFX auto
(game.getPlayer() as actor).knockAreaEffect(1,1600)
isMod.apply(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

activator Property gate  Auto  

objectReference Property GateRef  Auto  

imageSpaceModifier Property isMod  Auto  

visualEffect Property trailFX  Auto  

objectReference Property MuralEye  Auto  
