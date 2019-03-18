Run, Sublime_text1.exe

Gui +LastFound
hWnd := WinExist()

DllCall( "RegisterShellHookWindow", UInt, hWnd )
MsgNum := DllCall( "RegisterWindowMessage", Str, "SHELLHOOK" )
OnMessage( MsgNum, "ShellMessage" )
goto onclose
Return ;    // End of Auto-Execute Section //

ShellMessage( wParam,lParam ) {

    WinGetTitle, Title, ahk_id %lParam%

    If ( wParam = 1 ){ ;  HSHELL_WINDOWACTIVATED

        If InStr( Title, "This is an unregistered copy" )
        SetTimer, fucksl, -1
    }
}


;SetTimer, onclose, -1
;SetTimer, fucksl, -1
;return

fucksl:
; loop {
    ; SetTitleMatchMode, 2
    ; WinWait,  This is an unregistered copy
    WinClose, This is an unregistered copy
    ; }
    return

    onclose:
    SetTitleMatchMode, 2
    WinWait, - Sublime Text (
    WinWaitClose
    ExitApp
    return

