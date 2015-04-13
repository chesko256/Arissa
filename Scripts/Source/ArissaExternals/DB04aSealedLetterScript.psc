Scriptname DB04aSealedLetterScript extends ReferenceAlias  

Quest Property DB05  Auto  



Event OnEquipped(Actor akActor)

if akActor == Game.GetPlayer()
	DB05Script Script = DB05 as DB05Script
	Script.Unsealed = 1
 endIf
 
EndEvent


