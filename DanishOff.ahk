#Include YourOriginalScript.ahk
 
CapsLock::
    run, DanishOn.ahk
    SoundPlay, %A_WinDir%\media\Speech On.wav
    TrayTip, , Danish On
    Suspend, On
    Sleep 2000
    ExitApp
    return