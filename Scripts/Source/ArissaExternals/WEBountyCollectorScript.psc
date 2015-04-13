Scriptname WEBountyCollectorScript extends Quest  

Location Property EastmarchHoldLocation Auto 
Location Property FalkreathHoldLocation Auto 
Location Property HaafingarHoldLocation Auto 
Location Property HjaalmarchHoldLocation Auto 
Location Property PaleHoldLocation Auto 
Location Property ReachHoldLocation Auto 
Location Property RiftHoldLocation Auto 
Location Property WhiterunHoldLocation Auto 
Location Property WinterholdHoldLocation Auto 

Faction Property CrimeFactionEastmarch Auto 
Faction Property CrimeFactionFalkreath Auto 
Faction Property CrimeFactionHaafingar Auto 
Faction Property CrimeFactionHjaalmarch Auto 
Faction Property CrimeFactionPale Auto 
Faction Property CrimeFactionReach Auto 
Faction Property CrimeFactionRift Auto 
Faction Property CrimeFactionWhiterun Auto 
Faction Property CrimeFactionWinterhold Auto 


MiscObject Property Gold001 Auto


GlobalVariable Property WEBountyCollectorCrimeGold Auto

Faction property myCrimeFaction auto hidden
int myCrimeGold

float myCrimeGoldModified

float BountyCollectorModifier = 1.2

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, \
  int aiValue1, int aiValue2)
  
  

                if akLocation == EastmarchHoldLocation
                                myCrimeFaction = CrimeFactionEastmarch
                                
                elseif akLocation == FalkreathHoldLocation
                               myCrimeFaction ==CrimeFactionFalkreath
							   
			   elseif akLocation == HaafingarHoldLocation
								myCrimeFaction = CrimeFactionHaafingar
				
				elseif akLocation == HjaalmarchHoldLocation
								myCrimeFaction = CrimeFactionHjaalmarch
								
				elseif akLocation == PaleHoldLocation
								myCrimeFaction = CrimeFactionPale
								
				elseif akLocation == ReachHoldLocation
								myCrimeFaction = CrimeFactionReach
								
				elseif akLocation == RiftHoldLocation
								myCrimeFaction = CrimeFactionRift
								
				elseif akLocation == WhiterunHoldLocation
								myCrimeFaction = CrimeFactionWhiterun
								
				elseif akLocation == WinterholdHoldLocation
								myCrimeFaction = CrimeFactionWinterhold
	
				EndIf
  
                myCrimeGold = myCrimeFaction.GetCrimeGold()
                myCrimeGoldModified = myCrimeGold * BountyCollectorModifier
				myCrimeGoldModified as int
				(self + "my crime modified is" + myCrimeGoldModified)
                WEBountyCollectorCrimeGold.setValue(myCrimeGoldModified)
				UpdateCurrentInstanceGlobal(WEBountyCollectorCrimeGold)
                                
  
  EndEvent
  
  
  ;called in dialogue like: (GetOwningQuest() as WEBountyCollectorQuestScript).payMyCrimeGold()
  function payMyCrimeGold()
  
                
				;myCrimeGoldModified as int
                Game.GetPlayer().RemoveItem(Gold001, myCrimeGoldModified as int)
                myCrimeFaction.modCrimeGold( -mycrimegold )
				myCrimeFaction.setPlayerEnemy(false)
				game.getplayer().stopCombatAlarm()
; 				debug.trace(self + "payMyCrimeGold() clearing crime gold")
                
  
  EndFunction
  
  
