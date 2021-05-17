using Printf
using SHA


bytes2hex(sha256("11865457 Vanilla Cafe"))


for i = 10000000:100000000
    if i % 1000000 == 0
        println(i)
    end
    s = @sprintf("%d Cola Decaf", i)
    h = bytes2hex(sha256(s))
    if occursin(r"c01a", h)
        if occursin(r"decaf", h)
            println("found match for s: " , s)
            println(h)
        end
    end
end
