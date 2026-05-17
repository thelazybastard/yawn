package yawn

import "core:fmt"
import "core:os"
import "base:runtime"
import "core:strconv"
import "core:thread"
import "core:time"


main ::proc() {
    arguments := os.args

    minutes, ok := strconv.parse_int(arguments[2])

    if len(arguments) > 3 || len(arguments) < 2 || !ok do runtime.exit(1)

    switch {
    case arguments[1] == "start" && arguments[2] == "":

    case arguments[1] == "stop":
        
    case:
        runtime.exit(1) 
    }
}


