scriptname DA13OrchendorSCRIPT extends actor
{script for the elf "boss" of Bthardamz}

quest property DA13 auto
{set to DA13 only}

EVENT onDeath(actor murderer)
	DA13.setStage(73)
; 	debug.trace("Orchendor has died, DA13 stage 73 set")
endEVENT
