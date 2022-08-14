; coord mode
CoordMode, Mouse, Screen

; offset
offset := 100

; default suspend
Suspend
return

; small offset
f::
offset := 10
return

; reset offset
d::
offset := 100
return

; move - up
Up::
MouseGetPos, X, Y
Y -= offset
DllCall("SetCursorPos", "int", X, "int", Y)
return

; move - down
Down::
MouseGetPos, X, Y
Y += offset
DllCall("SetCursorPos", "int", X, "int", Y)
return

; move- left
Left::
MouseGetPos, X, Y
X -= offset
DllCall("SetCursorPos", "int", X, "int", Y)
return

; move- right
Right::
MouseGetPos, X, Y
X += offset
DllCall("SetCursorPos", "int", X, "int", Y)
return

; scroll - up
s & Up::
Click, WheelUp
return

; scroll - down
s & Down::
Click, WheelDown
return

; click - left
Space::
Click
return

; click - right
Shift::
Click, Right
return

; suspend
^!Up::
Suspend
return