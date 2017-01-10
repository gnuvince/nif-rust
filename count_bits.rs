#![crate_type = "staticlib"]

#[no_mangle]
pub fn count_bits(mut n: usize) -> usize {
    let mut count = 0;
    while n != 0 {
        count += n & 1;
        n >>= 1;
    }
    return count;
}
