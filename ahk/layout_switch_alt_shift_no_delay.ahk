CapsLock::{
    SetCapsLockState("Off")
    Send("{Alt down}{Shift down}{Shift up}{Alt up}")
}

+CapsLock::{
    if GetKeyState("CapsLock", "T") {
        SetCapsLockState("Off")  ; Выключаем Caps Lock, если был включен
    } else {
        SetCapsLockState("On")   ; Включаем Caps Lock, если был выключен
    }
}
