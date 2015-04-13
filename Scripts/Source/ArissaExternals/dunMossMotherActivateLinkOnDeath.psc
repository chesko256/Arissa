scriptName dunMossMotherActivateLinkOnDeath extends actor
{Just activates a linkedref when the actor dies.}

Keyword property LinkName Auto

auto STATE waiting
	EVENT onDeath(actor killer)
		Self.GetLinkedRef(LinkName).Activate(Self)
	endEVENT
endSTATE

STATE inactive
endSTATE

