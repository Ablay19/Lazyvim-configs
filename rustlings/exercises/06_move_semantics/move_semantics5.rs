#![allow(clippy::ptr_arg)]
fn get_char(data: &String) -> char {
    data.chars().last().unwrap()
}
fn string_uppercase(mut data: String) {
    data = data.to_uppercase();
    println!("{data}");
}
fn main() {
    let data = "Rust is great!".to_string();
    data.chars().last().unwrap();
    string_uppercase(data);
}
