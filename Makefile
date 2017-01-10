all:
	rustc -O count_bits.rs
	gcc -o count_bits_nif.so -fpic -shared count_bits_nif.c -ldl -lpthread -lgcc_s -lc -lm -lrt -lutil libcount_bits.a

clean:
	rm -f *.so *.a *.beam
