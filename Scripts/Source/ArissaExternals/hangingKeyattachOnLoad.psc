Scriptname hangingKeyattachOnLoad extends ObjectReference  

objectReference property pegDummy auto
explosion property fakeForceBallNudge auto

EVENT onLoad()
	utility.wait(5)
	debug.messageBox("attempt load 3d block hanging key")
	game.addHavokBallAndSocketConstraint(self,"rigidBodyDummy",pegDummy,"AttachDummy",0,0,0)
	game.addHavokBallAndSocketConstraint(self,"BASE meshes\\Clutter\\KeyHanging01.nif",pegDummy,"AttachDummy",0,-10,0)
endEVENT 

EVENT onHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		game.removeHavokConstraints(self,"BASE meshes\\Clutter\\KeyHanging01.nif",pegDummy,"AttachDummy")
		pegDummy.placeatme(fakeForceBallNudge)
endEVENT

EVENT onGrab()
		game.removeHavokConstraints(self,"BASE meshes\\Clutter\\KeyHanging01.nif",pegDummy,"AttachDummy")
		pegDummy.placeatme(fakeForceBallNudge)
endEVENT
