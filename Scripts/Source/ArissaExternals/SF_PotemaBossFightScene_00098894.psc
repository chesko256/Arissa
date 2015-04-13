;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 32
Scriptname SF_PotemaBossFightScene_00098894 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
scriptActual.phase = "FOUR"
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
0; When done taunting, open first wave sarcophogi
QF_dunMS06_0001F142 QST = getOwningQuest() as QF_dunMS06_0001F142
objectReference Potema = QST.Alias_PotemaBossEntity.getReference()
objectReference WaveC01 = QST.Alias_WaveC_Enemy01.getReference()
objectReference WaveC02 = QST.Alias_WaveC_Enemy02.getReference()
objectReference WaveC03 = QST.Alias_WaveC_Enemy03.getReference()
WaveC01.Activate(Potema)
WaveC02.Activate(Potema)
WaveC03.Activate(Potema)
(WaveC01 as actor).startCombat(game.getPlayer())
(WaveC02 as actor).startCombat(game.getPlayer())
(WaveC03 as actor).startCombat(game.getPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; When done taunting, open first wave sarcophogi
QF_dunMS06_0001F142 QST = getOwningQuest() as QF_dunMS06_0001F142
objectReference Potema = QST.Alias_PotemaBossEntity.getReference()
(Potema.getLinkedRef()).Activate(Potema)
Quest_MS06.Setstage(125)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
scriptActual.phase = "TWO"
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; When done taunting, open first wave sarcophogi
QF_dunMS06_0001F142 QST = getOwningQuest() as QF_dunMS06_0001F142
objectReference Potema = QST.Alias_PotemaBossEntity.getReference()
objectReference WaveA01 = QST.Alias_WaveA_Enemy01.getReference()
objectReference WaveA02 = QST.Alias_WaveA_Enemy02.getReference()
WaveA01.Activate(Potema)
WaveA02.Activate(Potema)
QST.Alias_WaveA_Enemy01.getActorReference().startCombat(game.getPlayer())
(WaveA02 as actor).startCombat(game.getPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
scriptActual.phase = "THREE"
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; When done taunting, open first wave sarcophogi
QF_dunMS06_0001F142 QST = getOwningQuest() as QF_dunMS06_0001F142
objectReference Potema = QST.Alias_PotemaBossEntity.getReference()
objectReference WaveB01 = QST.Alias_WaveB_Enemy01.getReference()
objectReference WaveB02 = QST.Alias_WaveB_Enemy02.getReference()
objectReference WaveB03 = QST.Alias_WaveB_Enemy03.getReference()
WaveB01.Activate(Potema)
WaveB02.Activate(Potema)
WaveB03.Activate(Potema)
(WaveB01 as actor).startCombat(game.getPlayer())
(WaveB02 as actor).startCombat(game.getPlayer())
(WaveB03 as actor).startCombat(game.getPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

quest Property Quest_MS06  Auto  

objectReference Property scriptDummy  Auto  

dunPotemasMS06BossFightDummy property scriptActual auto
