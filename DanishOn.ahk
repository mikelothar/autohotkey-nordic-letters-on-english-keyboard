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