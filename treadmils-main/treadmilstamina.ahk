;Written by Zerr
SetTimer, OpenScript, 10 
ScriptActive := False 
StartMouseX := 0 
StartMouseY := 0 

Gui, Add, Text, x10 y10 w200 h30, Stamina Tapis de course
Gui, Add, Text, x10 y25 w200 h30, Make sure you have watched the tutorial on how to set up the macro!
Gui, Add, Text, x10 y40 w200 h30, Also make sure you have full Hunger before starting the macro!
Gui, Add, Text, x10 y55 w200 h30, Controls:
Gui, Add, Text, x10 y70 w200 h30, K = Start Macro
Gui, Add, Text, x10 y85 w200 h30, L = Exit Macro
Gui, Add, Text, x10 y100 w200 h30, P = Pause Macro (Doesn't work)
Gui, Show, x245 y700 w300 h115, Stamina


OpenScript:
     
    SetTitleMatchMode, 2 
    WinActivate, % "ahk_id " Roblox 
    WinGet, Roblox, ID, ahk_exe RobloxPlayerBeta.exe 
    WinMove, % "ahk_id " Roblox, , 0, 0, 810, 610 
        	
    return




FindFood:
    if (ScriptActive) {
        
        
        Food = 1
        
        
    Loop,
        
    {
        
        ImageFileName := A_WorkingDir . "\bin\food\food" . Food . ".bmp"

        ImageSearch, FoundX, FoundY, 260, 585, 509, 618, *50 %ImageFileName%
        If ErrorLevel = 0
        {
            FoundX += 5
            MouseMove, %FoundX%, %FoundY%
            Sleep, 100
            Click
            Sleep, 100
            MouseMove, 70, 470
            Sleep, 100
            Click
            MouseMove, %FoundX%, %FoundY%
            Sleep, 2000
            Click
            Sleep, 100
            Gosub ClickDura
            
            return
        } else {
            Food++
            if (food >= 6)
            {
                ToolTip "No Food!!"
                ;no food LOG function insert here
                return
            }
        }
    }
    return


    
    }
        return

Train:
if (ScriptActive) {
    Sleep, 300
    StartTime := A_TickCount
    ToolTip "FEAR NISSAN SILVIA ON ASURA!"
    Loop,
    {
        ElapsedTime := A_TickCount - StartTime
    
        ImageSearch,,, 200, 209, 590, 235, *50 %A_ScriptDir%\bin\W.bmp
        if ErrorLevel = 0
        {				
            SendInput, w ;w
        }		
        ImageSearch,,, 200, 209, 590, 235, *50 %A_ScriptDir%\bin\A.bmp
        if ErrorLevel = 0
        {				
            SendInput, a ;a
        }
        ImageSearch,,, 200, 209, 590, 235, *50 %A_ScriptDir%\bin\S.bmp
        if ErrorLevel = 0
        {				
            Sendinput, s ;s
        }			
        ImageSearch,,, 200, 209, 590, 235, *50 %A_ScriptDir%\bin\D.bmp
        if ErrorLevel = 0
        {				
            Sendinput, d ;d
        }
        
        Sleep, 10

        
            if (ElapsedTime >= 60000)
                {
					Sleep, 5000
                    Gosub ClickDura
                    break
                }
                
    }
}
    return


ClickDura:
if (ScriptActive) {
   
    Loop,
        {
        PixelSearch,,, 190, 125, 172, 125, 0x000000, 30, Fast ; detects food bar '190' default value
        If ErrorLevel = 0
        {
            ToolTip "Is HUNGRY"
            Gosub FindFood
        } else {
            ToolTip "Is NOT HUNGRY"
            Sleep, 100
            MouseMove, %StartMouseX%, %StartMouseY%
            Click
            ToolTip "Searching..."
            ImageSearch,imagex, imagey, 335, 340, 485, 365, *100 %A_ScriptDir%\bin\stam2.png
            if ErrorLevel = 0
                {				
                    Sleep, 50
                    MouseMove, %imagex%, %imagey%
                    Sleep, 50
                    Click
                    Sleep, 50
                    MouseMove, %imagex%, %imagey%
                    Click
                    Gosub Train
                    return
                }else{
                    ToolTip "Missing Dura Image"
                }
        }
            
            
        }
}
return





k:: 
    ScriptActive := True 
    SetTimer, OpenScript, On 
    MouseGetPos, StartMouseX, StartMouseY 
    ImageSearch,,, 70, 50, 100, 67, *50 %A_ScriptDir%\bin\chat.bmp
    if ErrorLevel = 0
        {				
            MouseMove, 82, 54
                    Sleep, 50
            Click
        }
        Sleep, 50
    Gosub ClickDura
    return

p::
    ScriptActive := False 
    SetTimer, OpenScript, Off 
    
    return

l::ExitApp 


