CapsLock::{
    SetCapsLockState("Off") ; Отключаем Caps Lock
    ; Эмуляция нажатия Alt+Shift
    SendInput("{Alt down}")
    Sleep(50)
    SendInput("{Shift down}")
    Sleep(50)
    SendInput("{Shift up}")
    Sleep(50)
    SendInput("{Alt up}")
}

+CapsLock::{
    if GetKeyState("CapsLock", "T") {
        SetCapsLockState("Off")  ; Выключаем Caps Lock, если был включен
    } else {
        SetCapsLockState("On")   ; Включаем Caps Lock, если был выключен
    }
}
