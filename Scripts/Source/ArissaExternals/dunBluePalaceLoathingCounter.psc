Scriptname dunBluePalaceLoathingCounter extends ObjectReference  

OBJECTREFERENCE PROPERTY bwpLoathingController AUTO
QUEST PROPERTY pDA15Loathing AUTO

dunBluePalaceFearSCRIPT bwpLoathingScript

EVENT OnLoad()
			
	; //setting the master script to be the one with the stored vars
	bwpLoathingScript = bwpLoathingController AS dunBluePalaceFearSCRIPT
	
endEVENT

EVENT OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	IF(pDA15Loathing.getStage() <= 40)

		; //increment the hit counter if Pelagius is hit
		IF(akAggressor == bwpLoathingScript.invisAttacker1 || akAggressor == bwpLoathingScript.invisAttacker2)
			bwpLoathingScript.pelagCounter+=1
		ENDIF

		IF(bwpLoathingScript.pelagCounter >= 22)
			IF(SELF == bwpLoathingScript.pelagiusFear2)
				bwpLoathingScript.pelagiusFear2.disable()
				bwpLoathingScript.pelagiusFear2.placeAtMe(bwpLoathingScript.pelagiusFear1)
				bwpLoathingScript.pelagiusFear1.enable()
				
				bwpLoathingScript.invisAttacker1.disable()
				bwpLoathingScript.invisAttacker2.disable()
				
				bwpLoathingScript.pelagCounter = 0
				
			ELSEIF(SELF == bwpLoathingScript.pelagiusFear3)
				bwpLoathingScript.pelagiusFear3.disable()
				bwpLoathingScript.pelagiusFear3.placeAtMe(bwpLoathingScript.pelagiusFear2)
				bwpLoathingScript.pelagiusFear2.enable()
				
				bwpLoathingScript.pelagCounter = 0
				
			ENDIF
		ENDIF
	ENDIF
endEVENT
