Scriptname dunValthumeGorvaalDeath extends Actor


import game
import debug
	
quest Property dunValthumeQST auto



Function onDeath(Actor AkKiller)

dunValthumeQST.setstage(50)

endFunction