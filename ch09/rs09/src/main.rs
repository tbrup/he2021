// This is a comment, and is ignored by the compiler
// You can test this code by clicking the "Run" button over there ->
// or if you prefer to use your keyboard, you can use the "Ctrl + Enter" shortcut

// This code is editable, feel free to hack it!
// You can always return to the original code by clicking the "Reset" button ->

use sha256::digest;
use regex::Regex;
// This is the main function
fn main() {
    let cola_re = Regex::new(r"c01a").unwrap();
    let decaf_re = Regex::new(r"decaf").unwrap();
    let post = " Cola Decaf";

    for i in 10000000..100000000 {
        if i % 1000000 == 0 {
            println!("{}", i);
        }
        let hash = digest(i.to_string().to_owned() + &post);
        if cola_re.is_match(&hash) && decaf_re.is_match(&hash) {
            // let s = format!("{} Cola Decaf",i);
            let is = i.to_string().to_owned() + &post;
            println!("found match for s: {}", is);
            println!("{}", hash);
        }

    }
}