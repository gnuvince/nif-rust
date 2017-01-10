all: count_bits_nif.so

libcount_bits.a: count_bits.rs
	rustc -O $<

count_bits_nif.so: count_bits_nif.c libcount_bits.a
	gcc -o $@ -fpic -shared $< -ldl -lpthread -lgcc_s -lc -lm -lrt -lutil libcount_bits.a

clean:
	rm -f *.so *.a *.beam

.PHONY: all clean
