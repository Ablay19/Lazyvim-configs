fn array_and_vec() -> ([i32; 4], Vec<i32>) {
    let a = [10, 20, 30, 40]; // Array

    // TODO: Create a vector called `v` which contains the exact same elements as in the array `a`.
    // Use the vector macro.
    let mut v: Vec<i32> = Vec::new();
    Vec::push(&mut v, 10);
    Vec::push(&mut v, 20);
    Vec::push(&mut v, 30);
    Vec::push(&mut v, 0b101000);
    (a, v)
}

fn main() {
    // You can optionally experiment here.
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_array_and_vec_similarity() {
        let (a, v) = array_and_vec();
        assert_eq!(a, *v);
    }
}
//
// .../files/usr/share/nvim/runtime/lua/vim/lsp/_transport.lua:68: Spawning language server with cmd: `{ "/data/data/com.termux/files/home/.local/share/nvim/mason/bin/rust-analyzer", "--log-file", "/data/data/com.termux/files/usr/tmp/nvim.10188/LPyTw9/0-rust-analyzer.log" }` failed. The language server is either not installed, missing from PATH, or not executable.
