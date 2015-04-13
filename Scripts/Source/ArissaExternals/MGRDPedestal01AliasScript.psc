Scriptname MGRDPedestal01AliasScript extends ReferenceAlias  Conditional

ReferenceAlias Property Book01Activator  Auto  

ReferenceAlias Property Book02  Auto  

MagicEffect Property Flames  Auto  

int Property ReadyState Auto Conditional

Event OnActivate (ObjectReference ActionRef)
	
	if ActionRef == Game.GetPlayer()
		if ReadyState == 0
			if Game.GetPlayer().GetItemCount(Book01.GetReference()) > 0
				Game.GetPlayer().RemoveItem(Book01.GetReference(), 1, false, MGHoldingChest.GetReference())
					Book01Activator.GetReference().Enable()
				ReadyState = 1			
			endif
		elseif ReadyState == 1
			Book01Activator.GetReference().Disable()
			Game.GetPlayer().AddItem(Book01.GetReference(), 1)
			ReadyState = 0
		elseif ReadyState == 2
			Book01Activator.GetReference().Disable()
			Game.GetPlayer().AddItem(Book02.GetReference(), 1)
			ReadyState = 0
		endif
	endif

EndEvent


Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)

	if akEffect.HasKeyword(MagicDamageFire)
		if ReadyState == 1
;			Fireball.Cast(Self.GetReference(), Self.GetReference())
			Self.GetReference().PlaceAtMe(FireExplosion)			
;			Book01Activator.GetReference().Disable()
;			Book02.GetReference().Enable()
			ReadyState = 2
		endif
	endif

EndEvent

ReferenceAlias Property Book01  Auto  

Explosion Property FireExplosion  Auto  

Spell Property Fireball  Auto  

ReferenceAlias Property MGHoldingChest  Auto  

Keyword Property MagicDamageFire  Auto  
