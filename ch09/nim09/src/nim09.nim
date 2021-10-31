# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.
# import nimprof
import nimcrypto
# import re
import pegs
import strformat
import strutils

proc search() =
    var
        cola = peg"C01A"
        decaf = peg"DECAF"
    for i in 10000000..100000000:
    # for i in 10000000..20000000:
        if i %% 1000000 == 0:
            echo i
        var
            s = ""
        s.addInt i
        s.add " Cola Decaf"
        let
            h = $sha256.digest(s)
        if contains(h, "C01A"):
            if contains(h, "DECAF"):
                echo fmt"found match for s: {s}"
                echo h


when isMainModule:
    var test_in = "19614073 Cola Decaf"
    var 
        i = 19614073
        s = fmt"{i} Cola Decaf"
        h = $sha256.digest(s)
        cola = peg"C01A"
        decaf = peg"DECAF"
    echo sha256.digest(test_in)
    echo h
    echo s
    echo find(h, "C01A")
    echo find(h, "DECAF")
    echo h 
    echo find(h, cola)
    echo find(h, decaf)
    echo h =~ peg".*?DECAF.*"
    search()
