Scriptname FXChargenFXScript extends ObjectReference  
{Testing}

Import Weather

VisualEffect Property CameraAttachFX Auto 
VisualEffect Property CameraAttachFX2 Auto 
VisualEffect Property CameraAttachFX3 Auto 
Weather property WeatherForm auto
Weather property WeatherForm1 auto
ImageSpaceModifier Property ChargenImod Auto
int coldBreathDuration = 130
int doOnce = 0


	EVENT OnLoad()
		if doOnce == 0
			doOnce= 1
			CameraAttachFX.Play(game.GetPlayer(), 80)
			CameraAttachFX2.Play(game.GetPlayer(), 115)
			WeatherForm.SetActive(true)
			utility.wait(10)
			ChargenImod.Apply()
			utility.wait(75)
			CameraAttachFX3.Play(game.GetPlayer(), 60)		
			WeatherForm1.SetActive(true)
			utility.wait(65)	
			disable()
			delete()			
		endIf	
	ENDEVENT
	
	