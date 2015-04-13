scriptName magicSetWeatherScript extends ActiveMagicEffect
{Scripted magic effect For Changning The Weather}

Import Weather
Import Debug

;======================================================================================;
;  PROPERTIES  /
;=============/

Weather property WeatherForm auto
{The name of the Weather we will seeing instantly, if we have one.}

Int Property LocalWeatherA = 0 auto
{What order do we search for valid end weathers? Pleasant = 0, Cloudy = 1, Rainy = 2, Snow = 3}
Int Property LocalWeatherB = 1 auto
{What order do we search for valid end weathers? Pleasant = 0, Cloudy = 1, Rainy = 2, Snow = 3}
; Int Property LocalWeatherC = 2 auto
; {What order do we search for valid end weathers? Pleasant = 0, Cloudy = 1, Rainy = 2, Snow = 3}
; Int Property LocalWeatherD = 3 auto
; {What order do we search for valid end weathers? Pleasant = 0, Cloudy = 1, Rainy = 2, Snow = 3}

Bool Property bUseEndWeatherIfNoOption = True auto
{Do we want to use the end weather as a last resort?}

Weather property WeatherAfterForm auto
{The name of the Weather we will change to, after the spell, Overriding Local Weather.}

bool property bHoldWeatherUntilEnd = True auto
{Hold Weather until spell ends?}

;======================================================================================;
;  VARIABLES   /
;=============/

Weather EndWeather
bool bDontDoThis = false

;======================================================================================;
;   EVENTS     /
;=============/

Event OnEffectStart(Actor Target, Actor Caster)

	; Is there a sky at all? or Is the target already dead? Do we want to hit dead things?
	int index = 0
	if weather.GetSkyMode() != 3
		bDontDoThis = true
	else	
		while (index < WeatherExceptionList.getsize())
		if weather.GetCurrentWeather() == WeatherExceptionList.GetAt(index)
			; Don't allow skies to be cleared
			bDontDoThis = True
		endif
		index += 1
	endwhile

	endif

	if bDontDoThis == false
		if bUseEndWeatherIfNoOption == False
			if WeatherAfterForm != none
				EndWeather = WeatherAfterForm
			elseif FindWeather(LocalWeatherA) != none
				EndWeather = (FindWeather(LocalWeatherA))
			elseif FindWeather(LocalWeatherB) != none
				EndWeather = (FindWeather(LocalWeatherB))
			; elseif FindWeather(LocalWeatherC) != none
				; EndWeather = (FindWeather(LocalWeatherC))
			; elseif FindWeather(LocalWeatherD) != none
				; EndWeather = (FindWeather(LocalWeatherD))
			endif
		Else
			if FindWeather(LocalWeatherA) != none
				EndWeather = (FindWeather(LocalWeatherA))
			elseif FindWeather(LocalWeatherB) != none
				EndWeather = (FindWeather(LocalWeatherB))
			; elseif FindWeather(LocalWeatherC) != none
				; EndWeather = (FindWeather(LocalWeatherC))
			; elseif FindWeather(LocalWeatherD) != none
				; EndWeather = (FindWeather(LocalWeatherD))
			elseif WeatherAfterForm != none
				EndWeather = WeatherAfterForm
			endif
		endif

	
		trace("We found this weather for end use: " + EndWeather)
		
		if EndWeather != none
			trace("Applying End use Weather: " + EndWeather +" Now")
			EndWeather.SetActive(false,True)
		endif
		
		WeatherForm.SetActive(bHoldWeatherUntilEnd,True)
	endif
	
EndEvent



Event OnEffectFinish(Actor Target, Actor Caster)

	if bDontDoThis == false
		trace("Spell has ended, the weather: " + EndWeather +" Should now be happening.")

		if bHoldWeatherUntilEnd == True
			ReleaseOverride()
		endif
		
		; if EndWeather != none
			; trace("Applying End use Weather: " + EndWeather +" Now")
			; EndWeather.SetActive(false,True)
		; endif
	endif
	
EndEvent



FormList Property WeatherExceptionList  Auto  
