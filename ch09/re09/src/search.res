%%raw(`
const {
    createHash,
} = require('crypto');
`)

let dohash = %raw(`


function dohash(s) {
    const hash = createHash('sha256');

    hash.update(s);
    return hash.digest('hex');
}
`)

/* let dohash = (s) => { */
/*     let hash = createHash("sha256") -> update(s) */

/*     hash.digest("hex") */
/* } */

let cafe = %re("/cafe/")
let cola = %re("/c01a/")
let decaf = %re("/decaf/")

for i in 10000000 to 20000000 {
    if mod(i,1000000) == 0 {
        Js.log(Js.Int.toString(i))
    }
    let s = Js.Int.toString(i) ++ " Cola Decaf"
    /* let hash = ReScriptHash.Sha256.make(s) */
    let hash = dohash(s)
    if cola -> Js.Re.test_(hash) {
        if Js.Re.test_(decaf, hash) {
    /* if hash.indexOf("cafe") != -1 { */
    /*     if hash.indexOf("decaf") != -1 { */
            Js.log("found match for: " ++ s)
            Js.log(hash)
        }
    }
}
