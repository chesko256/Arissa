;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname TIF__000A1A93 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
getOwningQuest().setStage(15)

game.getplayer().removeItem(Deathbell, 1)
game.getplayer().removeItem(VampireDust, 1)
game.getplayer().removeItem(ingotSilver, 1)
game.getplayer().removeItem(gemRubyFlawless, 1)
akSpeaker.addItem(Deathbell, 1)
akSpeaker.addItem(VampireDust, 1)
akSpeaker.addItem(ingotSilver, 1)
akSpeaker.addItem(gemRubyFlawless, 1)

getOwningQuest().setStage(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

formList Property brewItems  Auto  

ingredient Property vampireDust  Auto  

Ingredient Property deathbell  Auto  

formList Property silverItems  Auto  

formList Property rubies  Auto  

MiscObject Property gemRubyFlawless  Auto  

MiscObject Property IngotSilver  Auto  
