package main

import (
	"crypto/sha256"
	"encoding/hex"
	"fmt"
	"strconv"
	"strings"
)

type res struct {
	ok bool
	s  string
}

func main() {
	ch := make(chan res)
	step := 5000000

	for i := 10000000; i < 100000000; i += step {
		if i%1000000 == 0 {
			fmt.Println(i)
		}
		go func(i int) {
			r := ""
			ok := false
			for j := 0; j < step; j++ {
				// s := fmt.Sprintf("%d Cola Decaf", i+j)
				// h := fmt.Sprintf("%x", sha256.Sum256([]byte(s)))
				s := strconv.Itoa(i+j) + " Cola Decaf"
				h1 := sha256.Sum256([]byte(s))
				h := hex.EncodeToString(h1[:])
				if strings.Contains(h, "c01a") && strings.Contains(h, "decaf") {
					ok = true
					r = r + fmt.Sprintf("found match for s: %s\n%s\n", s, h)
				}
			}
			ch <- res{ok, r}
		}(i)
	}

	for i := 10000000; i < 100000000; i += step {
		if i%1000000 == 0 {
			fmt.Println(i)
		}
		if r := <-ch; r.ok {
			fmt.Printf(r.s)
		}
	}
}
