# nif-rust

This is a simple example of how to call a Rust
function from Erlang.  There are three files of
interest:

- `count_bits.rs` : the implementation of the `count_bits` function in Rust;
- `count_bits_nif.c` : a C-written Erlang module;
- `count_bits.erl` : initialization of the NIF module.

## Compilation and usage

```
~/adgear/experiments/nif-rust$ make
rustc -O count_bits.rs
gcc -o count_bits_nif.so -fpic -shared count_bits_nif.c -ldl -lpthread -lgcc_s -lc -lm -lrt -lutil libcount_bits.a

~/adgear/experiments/nif-rust$ erl
Eshell V7.3  (abort with ^G)
1> c(count_bits).
{ok,count_bits}
2> count_bits:count_bits(16#fff1).
13
3>
```
