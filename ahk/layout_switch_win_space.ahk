CapsLock::{
    SetCapsLockState("Off") ; Отключаем Caps Lock
    Send("# ")              ; Отправляем Win+Space (переключение языка)
}

+CapsLock::{
    if GetKeyState("CapsLock", "T") {
        SetCapsLockState("Off")  ; Выключаем Caps Lock, если был включен
    } else {
        SetCapsLockState("On")   ; Включаем Caps Lock, если был выключен
    }
}