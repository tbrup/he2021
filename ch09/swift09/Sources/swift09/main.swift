import Foundation
import CommonCrypto

print("Hello, world!")

let inputString = "11865457 Vanilla Cafe"
let inputData = Data(inputString.utf8)

let hashed = SHA256.hashed(data: inputData)
print(hashed.description)
