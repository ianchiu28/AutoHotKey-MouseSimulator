; coord mode
CoordMode, Mouse, Screen

; offset
offset := 100

; default suspend
Suspend
return

; suspend
^!Up::
^!i::
Suspend
return

; ------------- ;
; adjust offset ;
; ------------- ;

; small offset
f::
offset := 10
return

; reset offset
d::
offset := 100
return


; ----- ;
; moves ;
; ----- ;

Up::
a & i::
Move("Up", offset)
return

Down::
a & k::
Move("Down", offset)
return

Left::
a & j::
Move("Left", offset)
return

Right::
a & l::
Move("Right", offset)
return


; ------- ;
; scrolls ;
; ------- ;

s & Up::
s & i::
Click, WheelUp
return

s & Down::
s & k::
Click, WheelDown
return

s & Left::
s & j::
Click, WheelLeft
return

s & Right::
s & l::
Click, WheelRight
return


; ------ ;
; clicks ;
; ------ ;

Space::
Click, Left
return

Shift::
Click, Right
return


; ------------- ;
; navigate tabs ;
; ------------- ;

^u::
Send ^{PgUp}
return

^o::
Send ^{PgDn}
return


; ---------- ;
; arrow keys ;
; ---------- ;

i::
Send {Up}
return

k::
Send {Down}
return

j::
Send {Left}
return

l::
Send {Right}
return


; --------- ;
; functions ;
; --------- ;

Move(direction, offset)
{
    MouseGetPos, X, Y
    Switch direction
    {
        case "Up":    Y -= offset
        case "Down":  Y += offset
        case "Left":  X -= offset
        case "Right": X += offset
    }
    DllCall("SetCursorPos", "int", X, "int", Y)
}