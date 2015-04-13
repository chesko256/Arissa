Scriptname E3DemoLoSDisabler extends ObjectReference  
{Written for showmanship, not efficiency.}

;import game

;int property preReqStage auto
;quest property e3demo auto

EVENT onLostLoS(Actor akViewer, ObjectReference akTarget)
; 	debug.trace("[E3 Demo] Line of Sight lost between "+akViewer+" & "+akTarget)
; 	debug.trace("[E3 Demo] Disable and Delete "+self)
	;self.disable()
	self.delete()
	unRegisterForLOS(game.getplayer(), self)
endEVENT
