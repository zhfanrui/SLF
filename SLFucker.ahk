#SingleInstance force
Run, Sublime_text1.exe "%1%"

Gui +LastFound
hWnd := WinExist()

DllCall( "RegisterShellHookWindow", UInt, hWnd )
MsgNum := DllCall( "RegisterWindowMessage", Str, "SHELLHOOK" )
OnMessage( MsgNum, "ShellMessage" )
goto onclose
Return

ShellMessage( wParam,lParam ) {
    WinGetTitle, Title, ahk_id %lParam%
    If ( wParam = 1 ){
        If InStr( Title, "This is an unregistered copy" )
        SetTimer, fucksl, -1
    }
}

fucksl:
    WinClose, This is an unregistered copy
    return

onclose:
    SetTitleMatchMode, 2
    WinWait, - Sublime Text (
    WinWaitClose
    ExitApp
    return
