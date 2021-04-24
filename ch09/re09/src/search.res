let cafe = %re("/cafe/")
let cola = %re("/c01a/")
let decaf = %re("/decaf/")

let does_contain = cafe -> Js.Re.test_(h)

Js.log(does_contain)

for i in 10000000 to 100000000 {
    if mod(i,1000000) == 0 {
        Js.log(Js.Int.toString(i))
    }
    let s = Js.Int.toString(i) ++ " Cola Decaf"
    let hash = ReScriptHash.Sha256.make(s)
    if cola -> Js.Re.test_(hash) {
        if Js.Re.test_(decaf, hash) {
            Js.log("found match for: " ++ s)
            Js.log(hash)
        }
    }
}