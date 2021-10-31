using Printf
using SHA


bytes2hex(sha256("11865457 Vanilla Cafe"))


for i = 10000000:100000000
    if i % 1000000 == 0
        println(i)
    end
    # s = @sprintf("%d Cola Decaf", i)
    s = string(i) * " Cola Decaf"
    h = bytes2hex(sha256(s))
    if occursin("c01a", h)
        if occursin("decaf", h)
            println("found match for s: " , s)
            println(h)
        end
    end
end
