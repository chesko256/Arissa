Scriptname dunBluePalaceSkeeverAliasSCRIPT extends ReferenceAlias  

REFERENCEALIAS PROPERTY saberCat AUTO


EVENT onDEATH(ACTOR akKiller)
	self.getRef().disable()
	saberCat.getRef().moveTo(self.getRef())
	saberCat.getRef().enable()
ENDEVENT
