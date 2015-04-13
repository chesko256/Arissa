scriptname dunIronbindKillMinionsOnDeath extends referenceAlias

keyword property MinionLink01 auto
keyword property MinionLink02 auto

EVENT onDeath(actor myKiller)

	objectReference selfREF = self.getReference()
	objectReference minion01
	minion01 = selfREF.getLinkedRef(MinionLink01)
	(minion01 as actor).kill()
	objectReference minion02
	minion02 = selfREF.getLinkedRef(MinionLink02)
	(minion02 as actor).kill()

endEVENT
