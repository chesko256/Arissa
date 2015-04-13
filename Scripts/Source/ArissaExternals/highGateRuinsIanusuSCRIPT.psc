Scriptname highGateRuinsIanusuSCRIPT extends ACTOR  

import debug
import utility

;Ianusu himself
;Actor Values:
;1 - Can Cast Heal
;2 - Can Cast Heal or Damage
;3 - Cast Heal
;4 - Cast Damage
REFERENCEALIAS Property aIanusu Auto

;the statues that show if Ianusu can use his big spells
OBJECTREFERENCE PROPERTY statueARef AUTO 
OBJECTREFERENCE PROPERTY statueBRef AUTO
OBJECTREFERENCE PROPERTY statueCRef AUTO
OBJECTREFERENCE PROPERTY statueDRef AUTO

;the statue status for script purposes
BOOL PROPERTY bStatA AUTO HIDDEN
BOOL PROPERTY bStatB AUTO HIDDEN
BOOL PROPERTY bStatC AUTO HIDDEN
BOOL PROPERTY bStatD AUTO HIDDEN

;do a count for turning on the heal timer
INT PROPERTY healCounter AUTO HIDDEN

;the high gate ruins master quest
QUEST PROPERTY hgRuinsQuest AUTO

; //THE GATE STUFF
OBJECTREFERENCE PROPERTY opener AUTO

;the gates to open on death
OBJECTREFERENCE PROPERTY gateA AUTO
OBJECTREFERENCE PROPERTY gateB AUTO

SCENE PROPERTY deathScene AUTO

EVENT onDeath(ACTOR ref)
	
	gateB.activate(opener)
	gateA.activate(opener)
	hgRuinsQuest.setStage(80)
	deathScene.start()

endEVENT
