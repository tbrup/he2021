package main

import (
	"crypto/sha256"
	"fmt"
	"regexp"
)

func main() {
	colaRe := regexp.MustCompile(`c01a`)
	decafRe := regexp.MustCompile(`decaf`)
	colaDecafRe := regexp.MustCompile(`^.*c01a.*decaf.*$`)
	h := sha256.Sum256([]byte("19614073 Cola Decaf"))
	hx := fmt.Sprintf("%x", h)
	fmt.Println(hx)
	fmt.Println(colaDecafRe.Match([]byte(hx)))
	for i := 10000000; i < 100000000; i++ {
		if i%1000000 == 0 {
			fmt.Println(i)
		}
		s := fmt.Sprintf("%d Cola Decaf", i)
		h := fmt.Sprintf("%x", sha256.Sum256([]byte(s)))
		// if colaDecafRe.Match([]byte(h)) {
		if colaRe.Match([]byte(h)) &&
			decafRe.Match([]byte(h)) {
			fmt.Printf("found match for s: %s\n", s)
			fmt.Println(h)

		}
	}
}
