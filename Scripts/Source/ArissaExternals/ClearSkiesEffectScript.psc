Scriptname ClearSkiesEffectScript extends ActiveMagicEffect  

GlobalVariable Property MAGProjectileStormVar auto
spell property MQClearSkyFogSpell auto
{This is the negative effect of being in the fog on throat of the world - this spell removes it if on caster.}

Event OnEffectStart(Actor akTarget, Actor akCaster)
	; if I'm affectd by the opressive fog on the Throat of the World, clear me of that.
	akCaster.removeSpell(MQClearSkyFogSpell)

	int index = 0
	bool ProtectedWeather = false
	while (index < WeatherExceptionList.getsize())
		if weather.GetCurrentWeather() == WeatherExceptionList.GetAt(index)
			; Don't allow skies to be cleared
			ProtectedWeather = True
		endif
		index += 1
	endwhile

	if ProtectedWeather == false
		; just send the script event when cast
		; get clear weather for player's location
		ClearWeatherOverride = Weather.FindWeather(NewWeatherType)
	; 	debug.trace(self + " ClearSkiesStart: clear weather = " + ClearWeatherOverride)

		if ClearWeatherOverride
			; transition to that weather abOverride = 
			ClearWeatherOverride.SetActive(True,True)
		endif
	
		MAGProjectileStormVar.setvalue(0.0)
	endif
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	if ClearWeatherOverride
; 		debug.trace(self + " releasing weather override on " + ClearWeatherOverride)
		Weather.ReleaseOverride()
	endif
endEvent

Weather ClearWeatherOverride	 ;current clear weather - need to release override when effect stops

int Property NewWeatherType = 0  Auto  

FormList Property WeatherExceptionList  Auto  
