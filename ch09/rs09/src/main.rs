// This is a comment, and is ignored by the compiler You can test this code by
// clicking the "Run" button over there -> or if you prefer to use your
// keyboard, you can use the "Ctrl + Enter" shortcut

// This code is editable, feel free to hack it!  You can always return to the
// original code by clicking the "Reset" button ->

use regex::Regex;
use sha256::digest;
use rayon::prelude::*;
//
// hard coded "find c01a" function
fn contains_c01a(hash: String) -> bool {
    let mut p1 = false;
    let mut p2 = false;
    let mut p3 = false;

    for c in hash.bytes() {
       if p3 && c == 0x61 { return true; }
       p3 = p2 && c == 0x31;
       p2 = p1 && c == 0x30;
       p1 = c == 0x63 ;
    }
    return false ;
}

//
// This is the main function
fn main() {
    let cola_re = Regex::new(r"c01a").unwrap();
    let decaf_re = Regex::new(r"decaf").unwrap();
    let post = " Cola Decaf";
    let do_rayon =false;

   if do_rayon {
       // rayon goes brr
        (10000000..100000000).into_par_iter().for_each(|i| {
            if i % 1000000 == 0 {
                println!("{}", i);
            }
            let hash = digest(i.to_string().to_owned() + &post);
            if cola_re.is_match(&hash) && decaf_re.is_match(&hash) {
                // let s = format!("{} Cola Decaf",i);
                let is = i.to_string().to_owned() + &post;
                println!("found match for s: {}", is);
                println!("{}", hash);
                println!("result of contains_c01a: {}", contains_c01a(hash));
            }
        });
   } else {
    for i in 10000000..100000000 {
        if i % 10000000 == 0 {
            println!("{}", i);
            }
            let hash = digest(i.to_string().to_owned() + &post);
            // if cola_re.is_match(&hash) && decaf_re.is_match(&hash) {
            if hash.contains("c01a") && hash.contains("decaf") {
                // let s = format!("{} Cola Decaf",i);
                let is = i.to_string().to_owned() + &post;
                println!("found match for s: {}", is);
                println!("{}", hash);
            }
        }
    }
}
