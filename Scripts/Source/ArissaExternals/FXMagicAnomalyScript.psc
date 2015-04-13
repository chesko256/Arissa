Scriptname FXMagicAnomalyScript extends Actor
{Handles the fx for the magic anomaly creatures}

;===============================================
Explosion Property deathExplosion Auto
Activator property AshPileObject auto
;===============================================
	
	EVENT onLoad()
		self.setScale(utility.randomFloat(0.7, 1.25))
	ENDEVENT
	
	EVENT onDying(actor myKiller)
		self.placeAtMe(deathExplosion)
		self.SetCriticalStage(self.CritStage_DisintegrateStart)
		self.AttachAshPile(AshPileObject)		
		self.SetAlpha (0.0,True)
		utility.wait(1.0)		
		self.SetCriticalStage(self.CritStage_DisintegrateEnd)
	ENDEVENT
	