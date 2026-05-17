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
    minutes := t.user_index

    fmt.println("Clock's tickin. You'll be notified when it ends!")

    time.sleep(time.Duration(minutes) * time.Minute)

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
