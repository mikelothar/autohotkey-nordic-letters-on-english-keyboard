####Autocorrect to nordic letters ÆØÅ using an english keyboard
This one is more or less inspired by Jan Karlsbjergs article [Typing Danish letters without a Danish keyboard], but slightly modified and then expanded. Jan’s solution is to replace any <kbd>,</kbd> <kbd>a</kbd> <kbd>e</kbd> key inputs to “æ”, <kbd>,</kbd> <kbd>o</kbd> <kbd>e</kbd> key inputs to “ø” and <kbd>,</kbd> <kbd>a</kbd> <kbd>a</kbd> key inputs to “å” (and same for capital letters). By including the comma in front of any combination, Jan would still be able to use his keyboard for typing english words containing *ae*, *oe* and *aa*, without them getting replaced. In its simplicity it’s a good solution, as long as you get used to typing comma in front of every ae, oe and aa. If you’re writing long emails, however, i believe this can be a pain to remember (and to type, as well). My solution is thus to use the <kbd>Caps Lock</kbd> key as a switch for turning replacementing on or off. You can use any other key or combination if you’d prefer, but for me this one does the job very well, it’s easy to reach for fast toggling, it’s only one key, and i would never have used it anyways (see my other AutoHotkey script about disabling the <kbd>Caps Lock</kbd> key completely). 

Behind the scenes, this is actually 3 scripts:

1. Your original script
1. A loader script, DanishOff.ahk, that include your original script
1. Another loader script, DanishOn.ahk, that also include your original script, but also contains the æøå replacement hotkeys

Loader script 1, DanishOff.ahk:

	#Include YourOriginalScript.ahk
	 
	CapsLock::
    	run, DanishOn.ahk
    	SoundPlay, %A_WinDir%\media\Speech On.wav
    	TrayTip, , Danish On
    	Suspend, On
	    Sleep 2000
	    ExitApp
	    return

Loader script 2, DanishOn.ahk:

	#Include YourOriginalScript.ahk
	 
	CapsLock::
	    run, DanishOff.ahk
	    SoundPlay, %A_WinDir%\media\Speech Off.wav
	    TrayTip, , Danish Off
	    Suspend, On
	    Sleep 2000
	    ExitApp
	    return
	 
	:?*:ae::
	    if(GetKeyState("Shift"))
	        Send {U+00C6}
	    else
	        Send {U+00E6}
	    return
	 
	:?*:oe::
	    if(GetKeyState("Shift"))
	        Send {U+00D8}
	    else
	        Send {U+00F8}
	    return
	 
	:?*:aa::
	    if(GetKeyState("Shift"))
	        Send {U+00C5}
	    else
	        Send {U+00E5}
	    return

Place the two Switch-scripts in the same place as your original script, or add the full path to them in the above. In the future, instead of starting your usual script, start the DanishOff.ahk script instead (or start the DanishOn.ahk script if you prefer to use this as default). It will keep all your original AutoHotkey definitions, loaded from line 1 in the above. *Remember to move the # tag from line 1*. On a side-note, line 5-8 in both scripts above can be removed, should you prefer toggling in stealth mode.

[Typing Danish letters without a Danish keyboard]:http://www.jankarlsbjerg.com/blog/archives/2009/08/08/typing-danish-letters-without-a-danish-keyboard/
