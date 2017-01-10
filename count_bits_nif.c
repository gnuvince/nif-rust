#include <erl_nif.h>

extern size_t count_bits(size_t);

static ERL_NIF_TERM count_bits_nif(ErlNifEnv *env,
    int argc, const ERL_NIF_TERM argv[]) {
	int x;
	size_t ret;

	if (!enif_get_int(env, argv[0], &x)) {
		return enif_make_badarg(env);
	}

	ret = count_bits((size_t) x);
	return enif_make_int(env, ret);
}

static ErlNifFunc nif_funcs[] = {
	{"count_bits", 1, count_bits_nif}
};

ERL_NIF_INIT(count_bits, nif_funcs, NULL, NULL, NULL, NULL);
