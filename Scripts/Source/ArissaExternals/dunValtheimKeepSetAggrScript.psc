scriptName dunValtheimKeepSetAggrScript extends referenceAlias
{This script is used to set the aggression of the bandits in the camp to 1 on load}


event onCellAttach()
	(self.getReference() as actor).setAV("Aggression", 1)
endEvent
