from PIL import Image


def hist(a):
    pal = {}
    for i in range(1014*1024):
        c = a[i]
        if c in pal:
            pal[c] += 1
        else:
            pal[c] = 1

    return pal


with open('AF', 'rb') as firstF:
    arr_af = firstF.read()
    pal = hist(arr_af)

    print(pal)

with open('3811', 'rb') as firstF:
    arr_af = firstF.read()
    pal = hist(arr_af)

    print(pal)
