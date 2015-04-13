Scriptname hangedManScript extends objectReference  
{Script for noose ropes.  Point to an attach dummy and a corpse}

objectReference property nooseDummy auto
{Point to a rigidBodyDummy placed at the end of the rope.}
objectreference property corpse auto
{the hung person}
explosion property fakeForceBallNudge auto

bool shotDown


EVENT onLoad()
	; this gets the guy actually hanging when the 3D is loaded up.
	if shotDown == FALSE
		;game.addHavokBallAndSocketConstraint(corpse,"NPC Neck [Neck]",nooseDummy,"AttachDummy",0,0,16)
		game.addHavokBallAndSocketConstraint(corpse,"NPC Neck [Neck]",self,"JointHelper01",0,0,16)
	endif
endEVENT


EVENT onHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
; 		debug.trace("Noose Rope Hit by: "+akAggressor)
; 		debug.trace("Noose Rope Hit by: "+akProjectile)
; 		debug.trace("Noose Rope Hit by: "+akSource)
		game.removeHavokConstraints(corpse,"NPC Neck [Neck]",self,"JointHelper01")
		nooseDummy.placeatme(fakeForceBallNudge)
		shotDown == TRUE
endEVENT
