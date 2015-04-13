Scriptname summonSkeletonLegionSCRIPT extends ActiveMagicEffect  

ACTORBASE PROPERTY skeletonType AUTO
ACTIVATOR PROPERTY summonPortal AUTO

OBJECTREFERENCE skeleton1 
OBJECTREFERENCE skeleton2
OBJECTREFERENCE skeleton3
OBJECTREFERENCE skeleton4
OBJECTREFERENCE skeleton5

OBJECTREFERENCE portal1
OBJECTREFERENCE portal2
OBJECTREFERENCE portal3
OBJECTREFERENCE portal4
OBJECTREFERENCE portal5

EVENT onEffectStart(ACTOR akTarget, ACTOR akCaster)

	skeleton1 = game.getPlayer().placeAtMe(skeletonType)
	portal1 = skeleton1.placeAtMe(summonPortal)
	skeleton2 = game.getPlayer().placeAtMe(skeletonType)
	portal2 = skeleton2.placeAtMe(summonPortal)
	skeleton3 = game.getPlayer().placeAtMe(skeletonType)
	portal3 = skeleton3.placeAtMe(summonPortal)
	;skeleton4 = game.getPlayer().placeAtMe(skeletonType)
	;skeleton5 = game.getPlayer().placeAtMe(skeletonType)
	
	utility.wait(5)
	
	portal1.disableNoWait()
	portal2.disableNoWait()
	portal3.disableNoWait()

	
endEVENT


EVENT onEffectFinish(ACTOR akTarget, ACTOR akCaster)

	skeleton1.disableNoWait()
	skeleton2.disableNoWait()
	skeleton3.disableNoWait()
	;skeleton4.disableNoWait()
	;skeleton5.disableNoWait()

endEVENT
