Scriptname FormArray extends Form

;Attach this to an object, then in ANOTHER script attached to that object, cast SELF (in that other script) as FormArray to access these functions [ myArray = (Self As Form) as FormArray ] .

;NOTE You can only attach this script ONCE to any given object. If you need more, then you need to create a copy of this script and give it a new name, and then cast the script calling it as that.


Form Form0
Form Form1
Form Form2
Form Form3
Form Form4
Form Form5
Form Form6
Form Form7
Form Form8
Form Form9
Form Form10
Form Form11
Form Form12
Form Form13
Form Form14
Form Form15
Form Form16
Form Form17
Form Form18
Form Form19
Form Form20
Form Form21
Form Form22
Form Form23
Form Form24
Form Form25
Form Form26
Form Form27
Form Form28
Form Form29
Form Form30
Form Form31
Form Form32
Form Form33
Form Form34
Form Form35
Form Form36
Form Form37
Form Form38
Form Form39
Form Form40
Form Form41
Form Form42
Form Form43
Form Form44
Form Form45
Form Form46
Form Form47
Form Form48
Form Form49
Form Form50
Form Form51
Form Form52
Form Form53
Form Form54
Form Form55
Form Form56
Form Form57
Form Form58
Form Form59
Form Form60
Form Form61
Form Form62
Form Form63
Form Form64
Form Form65
Form Form66
Form Form67
Form Form68
Form Form69
Form Form70
Form Form71
Form Form72
Form Form73
Form Form74
Form Form75
Form Form76
Form Form77
Form Form78
Form Form79
Form Form80
Form Form81
Form Form82
Form Form83
Form Form84
Form Form85
Form Form86
Form Form87
Form Form88
Form Form89
Form Form90
Form Form91
Form Form92
Form Form93
Form Form94
Form Form95
Form Form96
Form Form97
Form Form98
Form Form99


int iTop = -1
int iMaxArrayIndex = 99

int Function Size()
  return iTop + 1
endFunction

Form Function Pop()
  Form akRetVal
  if (iTop >= 0)
    GotoState("Item" + iTop)
    akRetVal = PopItem()
    iTop -= 1
    GotoState("")
  endIf
  return akRetVal
EndFunction

Function Add(Form akNewForm)
  if (iTop < iMaxArrayIndex)
    iTop += 1
    GotoState("Item" +iTop)
    AddItem(akNewForm)
    GotoState("")
  Else
;   	debug.trace(self + " FormArray.Add() tried to add a form beyond the max that it can hold (" + iMaxArrayIndex + ")")
  endIf
EndFunction

Form Function Get(int aiIndex)
  Form akRetVal
  if (aiIndex >= 0) && (aiIndex <= iMaxArrayIndex)
    GotoState("Item" + aiIndex)
    akRetVal = GetItem()
    GotoState("")
  endIf
  return akRetVal
endFunction

Form Function PopItem()
  return None
EndFunction

Function AddItem(Form akNewForm)
EndFunction

Form Function GetItem()
  return None
EndFunction

State Item0
  Form Function PopItem()
    Form akRetVal = Form0
    Form0 = None
    return akRetVal
  EndFunction
  
  Function AddItem(Form akNewForm)
    Form0 = akNewForm
  EndFunction
  
  Form Function GetItem()
    return Form0
  EndFunction
EndState

State Item1
  Form Function PopItem()
    Form akRetVal = Form1
    Form1 = None
    return akRetVal
  EndFunction
  
  Function AddItem(Form akNewForm)
    Form1 = akNewForm
  EndFunction
  
  Form Function GetItem()
    return Form1
  EndFunction
EndState

State Item2
  Form Function PopItem()
    Form akRetVal = Form2
    Form2 = None
    return akRetVal
  EndFunction
  
  Function AddItem(Form akNewForm)
    Form2 = akNewForm
  EndFunction
  
  Form Function GetItem()
    return Form2
  EndFunction
EndState

State Item3
  Form Function PopItem()
    Form akRetVal = Form3
    Form3 = None
    return akRetVal
  EndFunction
  
  Function AddItem(Form akNewForm)
    Form3 = akNewForm
  EndFunction
  
  Form Function GetItem()
    return Form3
  EndFunction
EndState

State Item4
  Form Function PopItem()
    Form akRetVal = Form4
    Form4 = None
    return akRetVal
  EndFunction
  
  Function AddItem(Form akNewForm)
    Form4 = akNewForm
  EndFunction
  
  Form Function GetItem()
    return Form4
  EndFunction
EndState

State Item5
  Form Function PopItem()
    Form akRetVal = Form5
    Form5 = None
    return akRetVal
  EndFunction
  
  Function AddItem(Form akNewForm)
    Form5 = akNewForm
  EndFunction
  
  Form Function GetItem()
    return Form5
  EndFunction
EndState

State Item6
  Form Function PopItem()
    Form akRetVal = Form6
    Form6 = None
    return akRetVal
  EndFunction
  
  Function AddItem(Form akNewForm)
    Form6 = akNewForm
  EndFunction
  
  Form Function GetItem()
    return Form6
  EndFunction
EndState

State Item7
  Form Function PopItem()
    Form akRetVal = Form7
    Form7 = None
    return akRetVal
  EndFunction
  
  Function AddItem(Form akNewForm)
    Form7 = akNewForm
  EndFunction
  
  Form Function GetItem()
    return Form7
  EndFunction
EndState

State Item8
  Form Function PopItem()
    Form akRetVal = Form8
    Form8 = None
    return akRetVal
  EndFunction
  
  Function AddItem(Form akNewForm)
    Form8 = akNewForm
  EndFunction
  
  Form Function GetItem()
    return Form8
  EndFunction
EndState

State Item9
  Form Function PopItem()
    Form akRetVal = Form9
    Form9 = None
    return akRetVal
  EndFunction
  
  Function AddItem(Form akNewForm)
    Form9 = akNewForm
  EndFunction
  
  Form Function GetItem()
    return Form9
  EndFunction
EndState


State Item10
	Form Function PopItem()
		Form akRetVal = Form10
		Form10 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form10 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form10
	EndFunction
EndState

State Item11
	Form Function PopItem()
		Form akRetVal = Form11
		Form11 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form11 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form11
	EndFunction
EndState

State Item12
	Form Function PopItem()
		Form akRetVal = Form12
		Form12 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form12 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form12
	EndFunction
EndState

State Item13
	Form Function PopItem()
		Form akRetVal = Form13
		Form13 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form13 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form13
	EndFunction
EndState

State Item14
	Form Function PopItem()
		Form akRetVal = Form14
		Form14 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form14 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form14
	EndFunction
EndState

State Item15
	Form Function PopItem()
		Form akRetVal = Form15
		Form15 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form15 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form15
	EndFunction
EndState

State Item16
	Form Function PopItem()
		Form akRetVal = Form16
		Form16 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form16 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form16
	EndFunction
EndState

State Item17
	Form Function PopItem()
		Form akRetVal = Form17
		Form17 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form17 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form17
	EndFunction
EndState

State Item18
	Form Function PopItem()
		Form akRetVal = Form18
		Form18 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form18 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form18
	EndFunction
EndState

State Item19
	Form Function PopItem()
		Form akRetVal = Form19
		Form19 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form19 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form19
	EndFunction
EndState

State Item20
	Form Function PopItem()
		Form akRetVal = Form20
		Form20 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form20 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form20
	EndFunction
EndState

State Item21
	Form Function PopItem()
		Form akRetVal = Form21
		Form21 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form21 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form21
	EndFunction
EndState

State Item22
	Form Function PopItem()
		Form akRetVal = Form22
		Form22 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form22 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form22
	EndFunction
EndState

State Item23
	Form Function PopItem()
		Form akRetVal = Form23
		Form23 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form23 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form23
	EndFunction
EndState

State Item24
	Form Function PopItem()
		Form akRetVal = Form24
		Form24 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form24 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form24
	EndFunction
EndState

State Item25
	Form Function PopItem()
		Form akRetVal = Form25
		Form25 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form25 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form25
	EndFunction
EndState

State Item26
	Form Function PopItem()
		Form akRetVal = Form26
		Form26 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form26 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form26
	EndFunction
EndState

State Item27
	Form Function PopItem()
		Form akRetVal = Form27
		Form27 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form27 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form27
	EndFunction
EndState

State Item28
	Form Function PopItem()
		Form akRetVal = Form28
		Form28 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form28 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form28
	EndFunction
EndState

State Item29
	Form Function PopItem()
		Form akRetVal = Form29
		Form29 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form29 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form29
	EndFunction
EndState

State Item30
	Form Function PopItem()
		Form akRetVal = Form30
		Form30 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form30 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form30
	EndFunction
EndState

State Item31
	Form Function PopItem()
		Form akRetVal = Form31
		Form31 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form31 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form31
	EndFunction
EndState

State Item32
	Form Function PopItem()
		Form akRetVal = Form32
		Form32 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form32 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form32
	EndFunction
EndState

State Item33
	Form Function PopItem()
		Form akRetVal = Form33
		Form33 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form33 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form33
	EndFunction
EndState

State Item34
	Form Function PopItem()
		Form akRetVal = Form34
		Form34 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form34 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form34
	EndFunction
EndState

State Item35
	Form Function PopItem()
		Form akRetVal = Form35
		Form35 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form35 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form35
	EndFunction
EndState

State Item36
	Form Function PopItem()
		Form akRetVal = Form36
		Form36 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form36 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form36
	EndFunction
EndState

State Item37
	Form Function PopItem()
		Form akRetVal = Form37
		Form37 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form37 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form37
	EndFunction
EndState

State Item38
	Form Function PopItem()
		Form akRetVal = Form38
		Form38 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form38 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form38
	EndFunction
EndState

State Item39
	Form Function PopItem()
		Form akRetVal = Form39
		Form39 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form39 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form39
	EndFunction
EndState

State Item40
	Form Function PopItem()
		Form akRetVal = Form40
		Form40 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form40 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form40
	EndFunction
EndState

State Item41
	Form Function PopItem()
		Form akRetVal = Form41
		Form41 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form41 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form41
	EndFunction
EndState

State Item42
	Form Function PopItem()
		Form akRetVal = Form42
		Form42 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form42 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form42
	EndFunction
EndState

State Item43
	Form Function PopItem()
		Form akRetVal = Form43
		Form43 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form43 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form43
	EndFunction
EndState

State Item44
	Form Function PopItem()
		Form akRetVal = Form44
		Form44 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form44 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form44
	EndFunction
EndState

State Item45
	Form Function PopItem()
		Form akRetVal = Form45
		Form45 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form45 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form45
	EndFunction
EndState

State Item46
	Form Function PopItem()
		Form akRetVal = Form46
		Form46 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form46 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form46
	EndFunction
EndState

State Item47
	Form Function PopItem()
		Form akRetVal = Form47
		Form47 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form47 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form47
	EndFunction
EndState

State Item48
	Form Function PopItem()
		Form akRetVal = Form48
		Form48 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form48 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form48
	EndFunction
EndState

State Item49
	Form Function PopItem()
		Form akRetVal = Form49
		Form49 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form49 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form49
	EndFunction
EndState

State Item50
	Form Function PopItem()
		Form akRetVal = Form50
		Form50 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form50 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form50
	EndFunction
EndState

State Item51
	Form Function PopItem()
		Form akRetVal = Form51
		Form51 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form51 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form51
	EndFunction
EndState

State Item52
	Form Function PopItem()
		Form akRetVal = Form52
		Form52 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form52 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form52
	EndFunction
EndState

State Item53
	Form Function PopItem()
		Form akRetVal = Form53
		Form53 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form53 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form53
	EndFunction
EndState

State Item54
	Form Function PopItem()
		Form akRetVal = Form54
		Form54 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form54 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form54
	EndFunction
EndState

State Item55
	Form Function PopItem()
		Form akRetVal = Form55
		Form55 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form55 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form55
	EndFunction
EndState

State Item56
	Form Function PopItem()
		Form akRetVal = Form56
		Form56 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form56 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form56
	EndFunction
EndState

State Item57
	Form Function PopItem()
		Form akRetVal = Form57
		Form57 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form57 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form57
	EndFunction
EndState

State Item58
	Form Function PopItem()
		Form akRetVal = Form58
		Form58 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form58 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form58
	EndFunction
EndState

State Item59
	Form Function PopItem()
		Form akRetVal = Form59
		Form59 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form59 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form59
	EndFunction
EndState

State Item60
	Form Function PopItem()
		Form akRetVal = Form60
		Form60 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form60 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form60
	EndFunction
EndState

State Item61
	Form Function PopItem()
		Form akRetVal = Form61
		Form61 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form61 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form61
	EndFunction
EndState

State Item62
	Form Function PopItem()
		Form akRetVal = Form62
		Form62 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form62 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form62
	EndFunction
EndState

State Item63
	Form Function PopItem()
		Form akRetVal = Form63
		Form63 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form63 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form63
	EndFunction
EndState

State Item64
	Form Function PopItem()
		Form akRetVal = Form64
		Form64 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form64 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form64
	EndFunction
EndState

State Item65
	Form Function PopItem()
		Form akRetVal = Form65
		Form65 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form65 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form65
	EndFunction
EndState

State Item66
	Form Function PopItem()
		Form akRetVal = Form66
		Form66 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form66 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form66
	EndFunction
EndState

State Item67
	Form Function PopItem()
		Form akRetVal = Form67
		Form67 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form67 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form67
	EndFunction
EndState

State Item68
	Form Function PopItem()
		Form akRetVal = Form68
		Form68 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form68 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form68
	EndFunction
EndState

State Item69
	Form Function PopItem()
		Form akRetVal = Form69
		Form69 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form69 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form69
	EndFunction
EndState

State Item70
	Form Function PopItem()
		Form akRetVal = Form70
		Form70 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form70 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form70
	EndFunction
EndState

State Item71
	Form Function PopItem()
		Form akRetVal = Form71
		Form71 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form71 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form71
	EndFunction
EndState

State Item72
	Form Function PopItem()
		Form akRetVal = Form72
		Form72 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form72 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form72
	EndFunction
EndState

State Item73
	Form Function PopItem()
		Form akRetVal = Form73
		Form73 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form73 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form73
	EndFunction
EndState

State Item74
	Form Function PopItem()
		Form akRetVal = Form74
		Form74 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form74 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form74
	EndFunction
EndState

State Item75
	Form Function PopItem()
		Form akRetVal = Form75
		Form75 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form75 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form75
	EndFunction
EndState

State Item76
	Form Function PopItem()
		Form akRetVal = Form76
		Form76 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form76 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form76
	EndFunction
EndState

State Item77
	Form Function PopItem()
		Form akRetVal = Form77
		Form77 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form77 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form77
	EndFunction
EndState

State Item78
	Form Function PopItem()
		Form akRetVal = Form78
		Form78 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form78 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form78
	EndFunction
EndState

State Item79
	Form Function PopItem()
		Form akRetVal = Form79
		Form79 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form79 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form79
	EndFunction
EndState

State Item80
	Form Function PopItem()
		Form akRetVal = Form80
		Form80 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form80 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form80
	EndFunction
EndState

State Item81
	Form Function PopItem()
		Form akRetVal = Form81
		Form81 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form81 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form81
	EndFunction
EndState

State Item82
	Form Function PopItem()
		Form akRetVal = Form82
		Form82 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form82 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form82
	EndFunction
EndState

State Item83
	Form Function PopItem()
		Form akRetVal = Form83
		Form83 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form83 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form83
	EndFunction
EndState

State Item84
	Form Function PopItem()
		Form akRetVal = Form84
		Form84 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form84 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form84
	EndFunction
EndState

State Item85
	Form Function PopItem()
		Form akRetVal = Form85
		Form85 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form85 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form85
	EndFunction
EndState

State Item86
	Form Function PopItem()
		Form akRetVal = Form86
		Form86 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form86 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form86
	EndFunction
EndState

State Item87
	Form Function PopItem()
		Form akRetVal = Form87
		Form87 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form87 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form87
	EndFunction
EndState

State Item88
	Form Function PopItem()
		Form akRetVal = Form88
		Form88 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form88 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form88
	EndFunction
EndState

State Item89
	Form Function PopItem()
		Form akRetVal = Form89
		Form89 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form89 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form89
	EndFunction
EndState

State Item90
	Form Function PopItem()
		Form akRetVal = Form90
		Form90 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form90 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form90
	EndFunction
EndState

State Item91
	Form Function PopItem()
		Form akRetVal = Form91
		Form91 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form91 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form91
	EndFunction
EndState

State Item92
	Form Function PopItem()
		Form akRetVal = Form92
		Form92 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form92 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form92
	EndFunction
EndState

State Item93
	Form Function PopItem()
		Form akRetVal = Form93
		Form93 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form93 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form93
	EndFunction
EndState

State Item94
	Form Function PopItem()
		Form akRetVal = Form94
		Form94 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form94 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form94
	EndFunction
EndState

State Item95
	Form Function PopItem()
		Form akRetVal = Form95
		Form95 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form95 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form95
	EndFunction
EndState

State Item96
	Form Function PopItem()
		Form akRetVal = Form96
		Form96 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form96 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form96
	EndFunction
EndState

State Item97
	Form Function PopItem()
		Form akRetVal = Form97
		Form97 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form97 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form97
	EndFunction
EndState

State Item98
	Form Function PopItem()
		Form akRetVal = Form98
		Form98 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form98 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form98
	EndFunction
EndState

State Item99
	Form Function PopItem()
		Form akRetVal = Form99
		Form99 = None
		return akRetVal
	EndFunction
	
	Function AddItem(Form akNewForm)
		Form99 = akNewForm
	EndFunction
	
	Form Function GetItem()
		return Form99
	EndFunction
EndState


