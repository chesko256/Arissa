scriptName DefaultWerewolfAttachPointSCRIPT extends objectReference

objectReference property RHand auto
objectReference property LHand auto
;objectReference property RFoot auto
;objectReference property LFoot auto

EVENT onLoad()
	forceAddRagdollToWorld()
	if RHand 
		game.addHavokBallAndSocketConstraint(self,"NPC R Hand [RHnd]",RHand,"AttachDummy",0,0,16)
	endif
	if LHand
		game.addHavokBallAndSocketConstraint(self,"NPC L Hand [RHnd]",LHand,"AttachDummy",0,0,16)
	endif
	;if RFoot
	;	game.addHavokBallAndSocketConstraint(self,"NPC R Foot [Rft ]",RFoot,"AttachDummy")
	;endif
	;if LFoot
	;	game.addHavokBallAndSocketConstraint(self,"NPC L Foot [Lft ]",LFoot,"AttachDummy")
	;endif	
	applyHavokImpulse(0,0,1,10)
endEVENT
