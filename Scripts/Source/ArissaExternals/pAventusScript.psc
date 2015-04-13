Scriptname pAventusScript extends ReferenceAlias  

Quest Property pDB01  Auto  
Quest Property DarkBrotherhoodQuest  Auto  
Scene Property pAventusSacramentScene  Auto  
Location Property pWindhelmAretinoResidence  Auto  

;Event OnInit()
;GetActorRef().RegisterForUpdate(1)
;EndEvent

Event OnUpdate()

;This controls Aventus Aretino doing the Black Sacrament
;if ( GetStage DB01 < 10 )
if pDB01.GetStage () < 10
	;if ( Player.GetInCell WindhelmAretinoResidence == 1 )
	if Game.GetPlayer().IsInLocation(pWindhelmAretinoResidence) == 1
		;if ( DarkBrotherhood.BlackSacrament == 0 )
		DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
		If DBScript.BlackSacrament == 0
			;StartScene AventusSacramentScene
			pAventusSacramentScene.Start()
			;Set DarkBrotherhood.BlackSacrament to 1
			DBScript.BlackSacrament = 1
		endif
	endif
endif

EndEvent






