from mnemonic import Mnemonic

challenge = {
    'adapt':    0x3555,
    'bind':     0x824e,
    'bless':    0x8fcf,
    'blind':    0x81db,
    'civil':    0x03ec,
    'craft':    0xed05,
    'garage':   0x9db4,
    'good':     0xd2ba,
    'half':     0x1272,
    'hip':      0x8d53,
    'home':     0x21b7,
    'hotel':    0x1cb0,
    'lonely':   0xe5b8,
    'magnet':   0x16b9,
    'metal':    0x770e,
    'mushroom': 0xdd80,
    'napkin':   0x0829,
    'reason':   0xecd3,
    'rescue':   0x5ef2,
    'ring':     0xe3b0,
    'shift':    0x4ea1,
    'small':    0xf1f6,
    'sunset':   0xb271,
    'tongue':   0xf08d
}


def getWordList():
    with open('english.txt', 'r') as inF:
        retVal = {}
        index = 0
        for w in inF.readlines():
            retVal[w[:-1]] = index
            index += 1
        return retVal


wl = getWordList()

# print(wl['adapt'])
# print(challenge['adapt'])

# invCh = {}
# for k in challenge.keys():
#     invCh[challenge[k]] = k

# for k in sorted(invCh.keys()):
#     print(k, invCh[k])

# for k in challenge.keys():
#     print('{:10s}'.format(k), '{:016b}'.format(challenge[k]), '{:016b}'.format(wl[k]))

# print()

sl = {}
for k in challenge.keys():
    c = challenge[k]
    w = wl[k]
    tmp = (c ^ w) & 2047
    print('{:10s}'.format(k), '{:#4d}'.format(tmp), '{:04x}'.format(tmp))
    sl[c] = k

for k in sorted(sl.keys()):
    print(sl[k])

input = []
for k in sorted(sl.keys()):
    input.append(sl[k])

# mnemo = Mnemonic("english")

# seed = mnemo.to_seed(' '.join(input), passphrase="")
# print(seed)
# entropy = mnemo.to_entropy(' '.join(input))
# print(entropy)

for k in sorted(challenge.keys()):
    ror = lambda val, r_bits, max_bits: \
        ((val & (2**max_bits-1)) >> r_bits%max_bits) | \
        (val << (max_bits-(r_bits%max_bits)) & (2**max_bits-1))
    print(k, end='')
    for i in range(16):
        x = challenge[k] ^ ror(wl[k], i, 16)
        print(' {:04X}'.format(x), end='')
    print()
