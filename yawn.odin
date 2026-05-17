package yawn

import "core:fmt"
import "core:os"
import "base:runtime"
import "core:strconv"
import "core:thread"
import "core:time"
import "core:c/libc"

main ::proc() {
    arguments := os.args

    minutes, ok := strconv.parse_int(arguments[2])

    if len(arguments) > 3 || len(arguments) < 2 || !ok do runtime.exit(1)

    switch {
    case arguments[1] == "start":
        t := thread.create(timer)
        t.user_index = minutes

        thread.start(t)
        thread.join(t)
        thread.destroy(t)  
    case:
        runtime.exit(1) 
    }
}

timer :: proc(t: ^thread.Thread) {
    countdown_minutes := t.user_index
    countdown_seconds := countdown_minutes * 60

    fmt.println("Clock's tickin. You'll be notified when it ends!")

    for i := countdown_seconds; i > 0; i -=1 {
        minutes := i / 60
        seconds := i % 60

        fmt.printf("\rTime remaining: %02d:%02d", minutes, seconds)

        time.sleep(1 * time.Second)
    }

    fmt.printf("\rTime remaining: 00:00\n")

    #partial switch ODIN_OS {
    case .Linux:
        libc.system("notify-send 'Yawn' 'Yo, timer finished'")
        
    case .Darwin:
        libc.system("osascript -e 'display notification \"Yo, timer finished\" with title \"Yawn\"'")
        
    case .Windows:
        libc.system("powershell -Command \"Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Yo, timer finished', 'Yawn')\"")
        
    case:
        fmt.println("Sorry bud, notifications aren't supported on this OS!")
    }
}
