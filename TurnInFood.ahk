#MaxThreadsPerHotkey 2
#SingleInstance force

toggle := false
runCount := 0
FoodCount := 100

Gui, Add, Text, Center-5 y+5 w100, Amount of Food:
Gui, Add, Edit, Center y+5 w300 h30 vFoodCount, %FoodCount%
Gui, Add, Button, Center y+5 w300 h30 gStartButtonClicked, Start Handing in Food

Gui, Add, Text, Center y+5 w300 h30 
Gui, Add, Text, Center-5 y+5 w300 h30, Not Running
Gui, Add, Text, Center y+5 w300 h30 
Gui, Add, Button, Center y+5 w300 h30 gStopButtonClicked, Pause
Gui, Add, Button, Center y+5 w300 h30 gExit, Quit

Gui, Show
return

StartButtonClicked:
    toggle := true

    GuiControl,, Not Running, Running (%runCount%)

    GuiControlGet, FoodCount
    LoopCount := FoodCount

    Loop, %LoopCount%
    {
        Sleep, 1000
        if (!toggle)
        {
            break
        }

        if (toggle)
            runCount++
            GuiControl,, Running, Running (%runCount%)

        if (toggle)
            SendInput, {e down}
        if (toggle)    
            Sleep, 2000
        if (toggle)
            SendInput, {e up}
        if (toggle)
            Sleep, 3000
        if (toggle)
            Click 6
        if (toggle)
            Sleep, 3000
        if (toggle)
            Click 1
        if (toggle)
            SendInput, {1 down}
        if (toggle)
            Sleep, 1000
        if (toggle)
            SendInput, {1 up}
        if (toggle)
            Sleep, 3000
        if (toggle)
            Click 6
        if (toggle)
            Sleep, 3000
        if (toggle)
            Click 1

        if (runCount >= LoopCount)
        {
            GuiControl,, Running, Finished (%runCount%)
            toggle := false
            return
        }

    }
    return

StopButtonClicked:
    toggle := false  ; Set toggle to false when the stop button is clicked
    GuiControl,, Running, Not Running
    return

Exit:
    ExitApp
    return

Return