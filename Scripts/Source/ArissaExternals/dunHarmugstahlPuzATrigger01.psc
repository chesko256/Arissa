Scriptname dunHarmugstahlPuzATrigger01 extends ObjectReference  
import Debug

objectReference Property flame01 Auto
objectReference Property flame02 Auto
objectReference Property flame03 Auto
objectReference Property flame04 Auto 
objectReference Property flame05 Auto 

ObjectReference Property door01 Auto
ObjectReference Property door02 Auto
ObjectReference Property door03 Auto 
ObjectReference Property door04 Auto
ObjectReference Property doorController Auto

int triggerEnable = 1

event onTrigger(objectReference TriggerRef)
	Actor ActorRef = TriggerRef as Actor
	if (ActorRef == game.getPlayer() && triggerEnable == 1 )
		triggerEnable = 0
		self.disable()    
		;;messagebox("TRIGGER")
		openDoor01()
		flameOn02()
		flameOn03()
		openDoor04()
		flame05.Enable()
		;Notification("test")
	endif
endevent 

function openDoor01()
		door01.activate(doorController)
		self.activate(game.getplayer())
endFunction

function openDoor02() 
		door02.activate(doorController)
		self.activate(game.getplayer())
endFunction

function openDoor03()
		door03.activate(doorController)
		self.activate(game.getplayer())
endFunction

function openDoor04()
		door04.activate(doorController)
		self.activate(game.getplayer())
endFunction

function flameOn01()
	flame01.Disable()
endfunction

function flameOn02()
	flame02.Disable()
endfunction

function flameOn03()
	flame03.Disable()
endfunction

function flameOn04()
	flame04.Disable()
endfunction
