Scriptname dunAnsilvundNoActivateAlias extends ReferenceAlias  
{generic script for one-shot quest stage update}

event onCellLoad()
	self.getReference().blockActivation()
EndEvent


