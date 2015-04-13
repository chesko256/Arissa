Scriptname FXShadowmereEmergeScript extends ObjectReference  
{Shadowmere: rise from your grave!}

Import Weather
Import  Utility

Actor property myShadowmereRef auto
{shadowmere ref to fade in}
Weather property WeatherForm auto
{Creepy weather to play during the sequence}
ObjectReference Property ShadowmerePoolMistWhite Auto
{Whit mist usually around the pool}
ObjectReference Property ShadowmerePoolMistBlack Auto
{black mist around the pool durig the fade in sequence}
ObjectReference Property ShadowmereLightRef Auto
{Bright blue light turned on during the sequence}
Armor Property HorseSaddleShadowmere Auto
int cleanupTime


	Event OnLoad() ;Once the FXShadowmereEmerge activator is emnabled this load block should run and set the stage for shadomeres arrival
		;Set scary weather on
		WeatherForm.SetActive(true)
		;Turn on blue light ref
		ShadowmereLightRef.enable()
		;Hide white mist and show black mist around pool during sequence
		ShadowmerePoolMistBlack.enable()
		ShadowmerePoolMistWhite.disable()
	EndEvent
	
	Event OnActivate(ObjectReference akActionRef); When the player is in the sweet spot trigger the fade it sequence by activating FXShadowmereEmer
			;Enable shadowmere but make him invisible by running his skinGone animation
			myShadowmereRef.enable()
			while (myShadowmereRef.Is3DLoaded()) == false
				wait(0.05)
			endWhile
			myShadowmereRef.unequipItem(HorseSaddleShadowmere)
			myShadowmereRef.PlaySubGraphAnimation( "SkinGone" )	
			;Play the bubble and smoke fx on the pool
			PlayAnimation("PlayAnim01")
			wait(3.0)		
			;fade in shadowfax
			myShadowmereRef.moveTo(self)
			myShadowmereRef.PlaySubGraphAnimation( "SkinFadeIn" )
			wait(5.0)	
			myShadowmereRef.equipItem(HorseSaddleShadowmere)
			wait(10.0)	
			;Turn off creepy weather
			ReleaseOverride()
			cleanupTime = 1
	endEvent
	
	Event OnUnLoad() 
	;If cleanup time run the following
		if  cleanupTime == 1
			;Switch back to regular mist
			ShadowmerePoolMistBlack.disable(true)		
			ShadowmerePoolMistWhite.enable(true)			
			;disable the light when the player in not around since it will pop
			ShadowmereLightRef.disable(true)
			;disable myself since i am a bunch of invisible art.
			self.disable()
			self.delete()
		endIf
	endEvent

	