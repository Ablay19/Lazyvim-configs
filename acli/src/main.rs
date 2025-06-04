use std::task::Context;

use colored::Colorize;
struct AB {
    a: u8,
    b: u8,
}
fn param(ab: AB) {
    println!("{} {}", ab.a, ab.b);
}
fn main() {
    println!("{}", "==".repeat(30).red());
    println!(
        r#" {:<3} {:<0} {} {} {} {}            {} ╰────────────────────────────────╯"#,
        "╭────────────────────────────────╮\n"
            .bright_red()
            .on_bright_blue(),
        "│",
        "Hi".red(),
        "ablay".blue().bold(),
        "something".purple().on_truecolor(5, 25, 36).magenta(),
        env!("PATH").green(),
        "│\n".normal(),
    );
    println!("{}", "==".repeat(30).red());
    param(AB { a: 2, b: 9 });
    panic!("hi");
}

// [`warning`]: `acli` (bin "acli") generated 1 warning
// Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.84s
//  Running `target/debug/acli`
// fn main2() {
//     use colored::*;
//
//     println!(
//         "{}",
//         String::from("this also works!")
//             .green()
//             .yellow()
//             .blue()
//             .bold()
//     );
//     println!("$PATH ==>>=>> {}", env!("PATH").green());
//     println!("{}", trying().1);
//     use std::env;
//     match env::current_exe() {
//         Ok(exe_path) => println!("Path of this executable is: {}", exe_path.display()),
//         Err(e) => println!("failed to get current exe path: {e}"),
//     };
//     println!("{}", trying().2);
//     println!("{}", trying().0);
//     fn trying() -> (String, String, ColoredString) {
//         let a = "this is blue".blue();
//         "this is red".red();
//         "this is red on blue".red().on_blue();
//         "this is also red on blue".on_blue().red();
//         "you can use truecolor values too!".truecolor(0, 255, 136);
//         "background truecolor also works :)".on_truecolor(135, 28, 167);
//         "you can also make bold comments".bold();
//         println!(
//             "{} {} {}",
//             "or use".cyan(),
//             "any".italic().yellow(),
//             "string type".cyan()
//         );
//         "or change advice. This is red".yellow().blue().red();
//         "or clear things up. This is default color and style"
//             .red()
//             .bold()
//             .clear();
//         "purple and magenta are the same".purple().magenta();
//         "bright colors are also allowed"
//             .bright_blue()
//             .on_bright_white();
//         "you can specify color by string"
//             .color("blue")
//             .on_color("red");
//         "and so are normal and clear".normal().clear();
//         String::from("this also works!").green().bold();
//         let format1 = format!(
//             "{:30}",
//             "format works as expected. This will be padded".blue()
//         );
//         let format2 = format!(
//             "{:.3}",
//             "and this will be green but truncated to 3 chars".green()
//         );
//         return (format1, format2, a);
//     }
//     string();
// }
// fn string() {
//     let a = r"
//              hi
// ";
//     let table = [
//         "╭────────────────────────────────╮",
//         "│",
//         "│",
//         "╰────────────────────────────────╯",
//     ];
//     let spec = ("╭", "╰", "╮", "╯");
//     println!(
//         r#"{table:?}\n{}\n{}{}{}{}"#,
//         table[0],
//         table[1],
//         "================".repeat(2).blue().bold(),
//         a,
//         "================".repeat(2).red().bold()
//     );
//     macro_rules! say {
//     ($($arg:tt)*) => {
//         println!("{}", format!($($arg)*));
//     };
// }
//
//     let x = "somethimg";
//     say!("hi {}", x);
//     println!("\ufeff")
// }
// ================
